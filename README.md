# GrafanaDashboardAWS

A ideia desse projeto é criar um painel à vista que apresenta uma visão macro da infraestrutura AWS utilizada com alguns itens de compliance e governança. Para que funcione é necessário ter instalado em sua infraestrutura um Zabbix e um Grafana.

Vale ressaltar que será necessário conhecimento em Zabbix e Grafana para que a estrutura fique funcional.

## Diretórios:

### Grafana

Contém o JSON do Dashboard e deve ser importado em seu Grafana.

### Zabbix-scripts

Contém o arquivo de UserParameter utilizado pelo Zabbix Agent para coletar métricas da AWS.
