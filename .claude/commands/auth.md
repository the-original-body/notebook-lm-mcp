# NotebookLM Cookie Extraction Guide

When the user needs to authenticate NotebookLM MCP, provide these instructions:

## Fastest Method: cURL Export

1. Open https://notebooklm.google.com (logged in)
2. Press `Cmd+Option+E` (opens DevTools directly in Network tab)
3. Type `batchexecute` in the filter field (filters out unimportant requests)
4. Press `Cmd+R` (reload page to generate requests)
5. Right-click on the `batchexecute` request
6. Select **Copy** → **Copy as cURL**
7. Paste the cURL command here

The cURL command contains all cookies including HttpOnly cookies (HSID, SSID) which are required for authentication.

## Important Notes

- `document.cookie` and bookmarklets do NOT work because HSID/SSID are HttpOnly cookies
- Tampermonkey also cannot access HttpOnly cookies
- The Network tab cURL export is the only reliable method
- Filter by `batchexecute` to avoid noise from other network requests

## After receiving the cURL command

Use the `save_auth_tokens` MCP tool with:
- `cookies`: Extract the cookie string from the `-b` or `--cookie` parameter
- `request_url`: The URL from the cURL command
- `request_body`: The `--data-raw` content if present

Then verify with `notebook_list` to confirm authentication works.
