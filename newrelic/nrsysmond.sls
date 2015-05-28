newrelic-sysmond:
  pkg:
    - installed

  service.running:
    - restart: True
    - watch:
      - pkg: newrelic-sysmond
      - file: /etc/newrelic/nrsysmond.cfg

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

docker_group:
  group.present:
    - name: docker
    - addusers:
      - newrelic
