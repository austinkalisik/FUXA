# TidalWave Control — installation + monthly support

Prepared 27 October 2026. This package adds the supplied TidalWave logo, a CSS 3D animated loader, reduced-motion support, an animated preview, and an installation/support enquiry page. The logo is the supplied JPEG, not a remodelled 3D asset. Effects run in CSS.

## Test

1. Open https://fuxa.tidaldigital.tech/brand-preview.html to review the animation.
2. Open https://fuxa.tidaldigital.tech/ and verify the loader gives way to the existing SCADA workspace.
3. Verify Overview, Process, Alarms, Trends, Equipment and Diagnostics navigation, then sign in with an existing authorised account to test editor access. No customer plant is commissioned in this master.
4. Open https://fuxa.tidaldigital.tech/services.html and test the quote email link. It opens the customer's email app; no email is sent automatically and no payment is collected.
5. Test the first customer PLC connection read-only, verify tag scaling and timestamps, alarm limits, trends, disconnect/reconnect behaviour and backup recovery before enabling any process writes.

## Commercial model

Sell discovery and installation as a scoped project, then monthly support. Before issuing a quote, set the installation fee, support currency and monthly fee, included support hours, response times, after-hours rate, travel/hardware exclusions and cancellation terms. Obtain customer acceptance; do not promise 24/7 service without staffing it.

The enquiry page deliberately publishes no invented prices. Payments and recurring billing are not activated. Use your existing invoicing process once pricing and terms are agreed, or connect your chosen payment provider after merchant onboarding.

## Customer commissioning record

- Customer / site / approver:
- PLC / RTU make, model, protocol and tag map:
- Required screen list and acceptance criteria:
- Operator and engineer roles:
- Alarm priorities, thresholds and acknowledgement permissions:
- Historian retention and backup schedule:
- Private network / VPN design and HTTPS hostname:
- Restore drill date and evidence:
- Installation fee / currency / payment milestones:
- Monthly support fee / included hours / response times / exclusions:
- Acceptance signature and support start date:

Create separate customer accounts, secrets and data storage for each deployment. Do not reuse the master's administrator credentials or JWT secret.

## Deployment and recovery

The deployed package is stored at `/opt/tidalwave-control/branding/current`. `apply-branding.sh` copies the reviewed static files into the existing Podman container. A systemd ExecStartPost drop-in reapplies them after container recreation. The active source index and pre-change container index are backed up before deployment. Do not run this package against a different FUXA version without reviewing its compiled index and script names.

To roll back, restore the saved source index and compiled index from the timestamped backup, disable the branding ExecStartPost drop-in, run `systemctl daemon-reload`, and retain existing appdata/db/images. A full container image backup and protected appdata backup should be kept separately. This package contains no credentials or customer data.

## ATSCADA package

`C:\Users\Auskal\WORK\ASCADA` contains the ATSCADA Professional Windows installer and a ZIP containing that installer. It is a separate .NET/IIS product, not the FUXA web application's source code. Installation/licence acceptance and any right to resell ATSCADA must be established with its vendor. This package does not install it, redistribute it or imply it is integrated with FUXA.

## Attribution

Retain the FUXA MIT licence and third-party notices in distributed software. TidalWave branding does not replace the upstream copyright notices. The repository's LICENSE remains intact.
