# Validation — 27 October 2026 (PNG time)

- Live FUXA HTTPS responds 200.
- Supplied TidalWave JPEG, animated CSS loader and favicon served successfully.
- Loader completes into the existing master workspace.
- Initial-layout `loginonstart` exception fixed in TypeScript source and reviewed compiled bundle. Browser log after the fix contains no new errors during startup.
- User-management API rejects anonymous requests with HTTP 401. Public guest project/settings access remains as previously configured.
- Installation and subscription enquiry page loads and uses explicit mailto links; no message is sent automatically.
- Starter offer: from PGK 350/month for one site's support, including up to one remote-support hour in PNG weekday business hours. Installation, hosting and additional hours quoted separately.
- Nginx configuration test passed. Gzip response verified; main frontend transfer reduced from 8,175,442 to 2,472,538 bytes.
- Existing configuration and SQLite appdata databases backed up on the VPS in a protected timestamped directory.
- Branding reapply script verified against the running container; systemd ExecStartPost configured for future container recreation. No container restart was forced during these checks.
- ATSCADA already installed locally; its login page opens at http://localhost:8080/Home/Login. Login, vendor licensing and site commissioning are not completed by this package.

Not yet validated: authenticated editor changes, customer PLC tags/process writes, alarm commissioning, historian restore drill, customer isolation/provisioning and payment-provider checkout/recurring debits. These require the customer's commissioning data, authorised accounts and an approved merchant account.
