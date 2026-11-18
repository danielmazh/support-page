# Support page

One donation page for all apps. Hebrew and English. Pays through PayPal.

## Link format

```
https://danielmazh.github.io/support-page/?app=<slug>&lang=<he|en>
```

- `app` - which app sent the visitor. Lowercase letters, digits and `-`, up to 40 characters.
  A slug that is not in `config.js` still works and is still tracked, with generic text.
- `lang` - optional. Without it the page follows the browser language.

## Files

- `index.html` - the page.
- `config.js` - PayPal account, amounts, app names, Supabase address and publishable key.
- `supabase/schema.sql` - tracking table `support_events` and report view `support_summary`.

## Tracking

Three events per app: `view` (page opened), `click` (donate pressed, with amount),
`return` (donor came back from PayPal). No personal data is stored.
The page can only insert rows. Read the report from the Supabase dashboard:

```sql
select * from support_summary;
```

The PayPal transaction also carries the app slug in the item number, so the PayPal
activity report shows the source of each real donation.

## Add an app

Add one line under `apps` in `config.js`, then link to the page with that slug.
