newrelic-sysmond:
  pkg:
    - installed

/etc/newrelic/nrsysmond.cfg:
  file:
    - managed
    - source: salt://newrelic/templates/nrsysmond.cfg
    - user: newrelic
    - group: newrelic
    - mode: 640
    - template: jinja
    - require:
      - pkg: newrelic-sysmond

nrsysmond-service:
  service.running:
    - reload: True
    - watch:
      - pkg: newrelic-sysmond
      - file: /etc/newrelic/nrsysmond.cfg
