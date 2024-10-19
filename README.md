# AquaTrack

<p align="center">
  <img src="https://github.com/user-attachments/assets/d1b33cc1-a6ed-4b61-ae6f-f584cdca197a" alt="AquaTrack Logo" width="150"/>
</p>

AquaTrack é um aplicativo de monitoramento de qualidade da água desenvolvido em **Swift** e **SwiftUI**, utilizando sensores e a tecnologia **Arduino** para coleta de dados e **Node-RED** para integração e manipulação de APIs. O projeto foi criado para oferecer uma solução prática e em tempo real para monitorar os parâmetros essenciais da água, visando a preservação do meio ambiente e a segurança de organismos aquáticos.

Este projeto foi desenvolvido como parte do **curso Hackatruck**, oferecido pelo **Instituto Eldorado** em parceria com a **IBM**, e utiliza o serviço **IBM Cloudant** para armazenamento de dados.

## Features

- Monitoramento de **parâmetros da água** (pH, temperatura, nitrato, nitrito, oxigênio e amônia) em tempo real.
- Interface gráfica responsiva e interativa em **SwiftUI**.
- Conexão com sensores via **Arduino** para coleta de dados.
- Integração com a API via **Node-RED** para processamento e visualização.
- **Armazenamento em nuvem** utilizando **IBM Cloudant** para salvar e consultar dados de qualidade da água.
- Notificações sobre níveis críticos dos parâmetros de qualidade da água.
- Histórico de dados para análise ao longo do tempo.

## Tecnologias Utilizadas

- **Swift** & **SwiftUI**: Desenvolvimento do app mobile para iOS.
- **Arduino**: Utilizado para conectar os sensores que monitoram a qualidade da água.
- **Node-RED**: Utilizado para criar a API responsável por enviar os dados dos sensores para o app.
- **IBM Cloudant**: Banco de dados NoSQL em nuvem para armazenar os dados monitorados.
