# GrafanaDashboardAWS

A ideia desse projeto é criar um painel à vista que dá uma visão macro da infraestrutura AWS utilizada com alguns itens de compliance e governança. Em resumo, o Zabbix coleta as informações através de AWS CLI e as armazena em sua base de dados. Daí, o Grafana acessa essas informações e exibe em seu painel.

Vale ressaltar que será necessário o Zabbix e o Grafana, além de conhecimento nestas ferramentas para que a estrutura fique funcional.

## Diretórios:

### Grafana

Contém o JSON do Dashboard e deve ser importado em seu Grafana.

### Zabbix

- Contém o arquivo de UserParameter utilizado pelo Zabbix Agent para coletar métricas da AWS.
- Contém uma imagem PNG de como se deve configurar um item dentro de um Host no Zabbix para buscar através do UserParameter.