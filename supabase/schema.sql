-- Tracking table for the support page.
-- The public page may only insert rows. It can never read, change or delete them.

create table if not exists public.support_events (
  id         bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  app        text not null check (app ~ '^[a-z0-9-]{1,40}$'),
  event      text not null check (event in ('view', 'click', 'return')),
  lang       text not null check (lang in ('he', 'en')),
  amount     numeric(10, 2) check (amount is null or (amount > 0 and amount <= 100000)),
  currency   text check (currency is null or currency in ('ILS', 'USD')),
  referrer   text check (referrer is null or length(referrer) <= 100)
);

create index if not exists support_events_app_created_idx
  on public.support_events (app, created_at desc);

alter table public.support_events enable row level security;

drop policy if exists "public insert only" on public.support_events;
create policy "public insert only"
  on public.support_events
  for insert
  to anon
  with check (true);

revoke all on public.support_events from anon;
grant insert on public.support_events to anon;

-- Report: visits, donate clicks and returns from PayPal, per app.
create or replace view public.support_summary
  with (security_invoker = true) as
select
  app,
  count(*) filter (where event = 'view')   as views,
  count(*) filter (where event = 'click')  as clicks,
  count(*) filter (where event = 'return') as returns,
  sum(amount) filter (where event = 'click' and currency = 'ILS') as clicked_ils,
  sum(amount) filter (where event = 'click' and currency = 'USD') as clicked_usd,
  max(created_at) as last_seen
from public.support_events
group by app
order by clicks desc, views desc;

revoke all on public.support_summary from anon;
