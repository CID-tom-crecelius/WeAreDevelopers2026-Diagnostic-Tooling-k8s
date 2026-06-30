#!//usr/bin/env bash

echo "=================================== /info"
curl -k -H "Authorization: Bearer eyJhbGciOiJFUzM4NCIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2dpdGh1Yi5jb20vZG90bmV0L2RvdG5ldC1tb25pdG9yIiwiZXhwIjoiMTc4MTM0NjA5NyIsImlzcyI6Imh0dHBzOi8vZ2l0aHViLmNvbS9kb3RuZXQvZG90bmV0LW1vbml0b3IvZ2VuZXJhdGVrZXkrTW9uaXRvckFwaUtleSIsInN1YiI6IjgyZTE0NTQ0LTVmM2EtNGQzZS1hNTgxLTdhNGE3M2M3YzI1ZCJ9.jMpeGWWucJrjq07qCOjDIP6qeBMejs7OIAkOB7bY2Bo9uphohY0gmO-ATQaoMEUxhd1g5kv6mWtv849_uYuXVwTYZv97RFU37AxNAiacQqqWzMIsLelTcDgGw4YauaGs" https://localhost:52323/info | jq

echo "=================================== /processes"
curl -k -H "Authorization: Bearer eyJhbGciOiJFUzM4NCIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2dpdGh1Yi5jb20vZG90bmV0L2RvdG5ldC1tb25pdG9yIiwiZXhwIjoiMTc4MTM0NjA5NyIsImlzcyI6Imh0dHBzOi8vZ2l0aHViLmNvbS9kb3RuZXQvZG90bmV0LW1vbml0b3IvZ2VuZXJhdGVrZXkrTW9uaXRvckFwaUtleSIsInN1YiI6IjgyZTE0NTQ0LTVmM2EtNGQzZS1hNTgxLTdhNGE3M2M3YzI1ZCJ9.jMpeGWWucJrjq07qCOjDIP6qeBMejs7OIAkOB7bY2Bo9uphohY0gmO-ATQaoMEUxhd1g5kv6mWtv849_uYuXVwTYZv97RFU37AxNAiacQqqWzMIsLelTcDgGw4YauaGs" https://localhost:52323/processes | jq


echo "=================================== /process?pid=1"
curl -vk -H "Authorization: Bearer eyJhbGciOiJFUzM4NCIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2dpdGh1Yi5jb20vZG90bmV0L2RvdG5ldC1tb25pdG9yIiwiZXhwIjoiMTc4MTM0NjA5NyIsImlzcyI6Imh0dHBzOi8vZ2l0aHViLmNvbS9kb3RuZXQvZG90bmV0LW1vbml0b3IvZ2VuZXJhdGVrZXkrTW9uaXRvckFwaUtleSIsInN1YiI6IjgyZTE0NTQ0LTVmM2EtNGQzZS1hNTgxLTdhNGE3M2M3YzI1ZCJ9.jMpeGWWucJrjq07qCOjDIP6qeBMejs7OIAkOB7bY2Bo9uphohY0gmO-ATQaoMEUxhd1g5kv6mWtv849_uYuXVwTYZv97RFU37AxNAiacQqqWzMIsLelTcDgGw4YauaGs" https://localhost:52323/process?pid=1 | jq


echo =================================== "/process?gcdump?pid=1"
curl -k -H "Authorization: Bearer eyJhbGciOiJFUzM4NCIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2dpdGh1Yi5jb20vZG90bmV0L2RvdG5ldC1tb25pdG9yIiwiZXhwIjoiMTc4MTM0NjA5NyIsImlzcyI6Imh0dHBzOi8vZ2l0aHViLmNvbS9kb3RuZXQvZG90bmV0LW1vbml0b3IvZ2VuZXJhdGVrZXkrTW9uaXRvckFwaUtleSIsInN1YiI6IjgyZTE0NTQ0LTVmM2EtNGQzZS1hNTgxLTdhNGE3M2M3YzI1ZCJ9.jMpeGWWucJrjq07qCOjDIP6qeBMejs7OIAkOB7bY2Bo9uphohY0gmO-ATQaoMEUxhd1g5kv6mWtv849_uYuXVwTYZv97RFU37AxNAiacQqqWzMIsLelTcDgGw4YauaGs" https://localhost:52323/gcdump?pid=1 -o mydump.gcdump 

echo =================================== "/gcdump?pid=1&egressProvider=monitorFile"
curl -k -H "Authorization: Bearer eyJhbGciOiJFUzM4NCIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2dpdGh1Yi5jb20vZG90bmV0L2RvdG5ldC1tb25pdG9yIiwiZXhwIjoiMTc4MTM0NjA5NyIsImlzcyI6Imh0dHBzOi8vZ2l0aHViLmNvbS9kb3RuZXQvZG90bmV0LW1vbml0b3IvZ2VuZXJhdGVrZXkrTW9uaXRvckFwaUtleSIsInN1YiI6IjgyZTE0NTQ0LTVmM2EtNGQzZS1hNTgxLTdhNGE3M2M3YzI1ZCJ9.jMpeGWWucJrjq07qCOjDIP6qeBMejs7OIAkOB7bY2Bo9uphohY0gmO-ATQaoMEUxhd1g5kv6mWtv849_uYuXVwTYZv97RFU37AxNAiacQqqWzMIsLelTcDgGw4YauaGs" "https://localhost:52323/gcdump?pid=1&egressProvider=monitorFile"

echo =================================== "/operations"
curl -k -H "Authorization: Bearer eyJhbGciOiJFUzM4NCIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2dpdGh1Yi5jb20vZG90bmV0L2RvdG5ldC1tb25pdG9yIiwiZXhwIjoiMTc4MTM0NjA5NyIsImlzcyI6Imh0dHBzOi8vZ2l0aHViLmNvbS9kb3RuZXQvZG90bmV0LW1vbml0b3IvZ2VuZXJhdGVrZXkrTW9uaXRvckFwaUtleSIsInN1YiI6IjgyZTE0NTQ0LTVmM2EtNGQzZS1hNTgxLTdhNGE3M2M3YzI1ZCJ9.jMpeGWWucJrjq07qCOjDIP6qeBMejs7OIAkOB7bY2Bo9uphohY0gmO-ATQaoMEUxhd1g5kv6mWtv849_uYuXVwTYZv97RFU37AxNAiacQqqWzMIsLelTcDgGw4YauaGs" https://localhost:52323/operations



