newrelic-repo:
  pkgrepo.managed:
    - humanname: newrelic-repo
    - name: deb http://apt.newrelic.com/debian/ newrelic non-free
    - file: /etc/apt/sources.list.d/newrelic.list
    - keyid: 548C16BF
    - keyserver: keyserver.ubuntu.com
    - require_in:
        - pkg: newrelic-sysmond
