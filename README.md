# GrafanaDashboardAWS

A ideia desse projeto é criar um painel à vista que dá uma visão macro da infraestrutura AWS utilizada com alguns itens de compliance e governança. Em resumo, o Zabbix coleta as informações através de AWS CLI e as armazena em sua base de dados. Daí, o Grafana acessa essas informações e exibe em seu painel.

Vale ressaltar que será necessário ter instalado o Zabbix e o Grafana, além de conhecimento nestas ferramentas para que a estrutura fique funcional. O resultado será o painel abaixo:

![](/img/Grafana.JPG)

## Diretórios:

### Grafana

* Contém o JSON do Dashboard e deve ser importado em seu Grafana.

### Zabbix

* zbx_export_templates.xml: arquivo de Template do Zabbix com os itens a serem coletados e de acordo com as configurações feitas no Grafana. Será necessário importar este template no seu Zabbix e vincular ao item criado para fazer as coletas na AWS.
* userparameter_aws.conf: arquivo de UserParameter utilizado pelo Zabbix Agent para coletar métricas da AWS.
* crontab: definições do crontab do Zabbix para executar scripts que dariam timeout pelo Zabbix Agent. Então, a saída é utilizar o Zabbix Trapper e, para isso acontecer, é necessário ter essa configuração no crontab.
* zabbix.item.s3.user.parameter.png: exeplo de como se deve configurar um item dentro de um Host no Zabbix para buscar através do UserParameter.

### OBSERVAÇÕES:

* Caso falte algum arquivo para coletar dados ou completar o dashboard, entre em contato que adicionamos aqui no repo.
* Caso tenha novas ideias ou um meio de aprimorar esse dashboard, podemos tentar ajudar.

Estes são os nossos contatos:
* Victor Fonseca: https://www.linkedin.com/in/victorcfonseca/
* Rafael Vinícius: https://www.linkedin.com/in/rafael-vin%C3%ADcius-cardoso-j%C3%BAlio-55087b50/

