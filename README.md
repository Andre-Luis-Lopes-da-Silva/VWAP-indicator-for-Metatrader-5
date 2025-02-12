# VWAP-indicator-for-Metatrader-5

𝗜𝗻𝗱𝗶𝗰𝗮𝗱𝗼𝗿 𝗩𝗪𝗔𝗣 (𝗩𝗼𝗹𝘂𝗺𝗲 𝗪𝗲𝗶𝗴𝗵𝘁𝗲𝗱 𝗔𝘃𝗲𝗿𝗮𝗴𝗲 𝗣𝗿𝗶𝗰𝗲) 𝗽𝗮𝗿𝗮 𝗺𝗲𝘁𝗮𝘁𝗿𝗮𝗱𝗲𝗿 𝟱

A VWAP (Volume Weighted Average Price) é um indicador técnico que calcula o preço médio ponderado por volume de um ativo durante um determinado período de tempo. A VWAP é amplamente usada em análise técnica para avaliar o preço médio de um ativo considerando o volume negociado, o que dá uma visão mais precisa do valor real de mercado em comparação com o simples preço médio.

𝐂𝐨𝐦𝐨 𝐮𝐭𝐢𝐥𝐢𝐳𝐚𝐫 𝐚 𝐕𝐖𝐀𝐏?

A VWAP é muito útil para traders que desejam identificar áreas de suporte ou resistência baseadas em volumes. Aqui estão algumas formas comuns de usá-la:

- Tendência de Alta (Acima da VWAP);
- Tendência de Baixa (Abaixo da VWAP);
- Reversão e Retestes;
- Alvo para Trades Intraday

Se quiserem usar o indicador dentro de um expert advisor, adicionem: **export** // necessário colocar o export para gerar o arquivo .mqh

Dessa forma: 

int OnCalculate(const int rates_total, const int prev_calculated,
                const datetime &time[], const double &open[],
                const double &high[], const double &low[],
                const double &close[], const long &tick_volume[],
                const long &volume[], const int &spread[]) export // necessário colocar o export para gerar o arquivo .mqh


Quando um arquivo de biblioteca ou de indicador precisa ser exportado em MQL5, é necessário usar a palavra-chave export ao final de funções que precisam ser acessadas fora do arquivo atual, como funções que serão utilizadas em outro arquivo .mqh (header). Sem isso, o código não será acessível para outros arquivos, resultando no erro de não geração do arquivo .mqh.

A palavra-chave export permite que a função seja visível e acessível a partir de outros módulos, como em indicadores ou Expert Advisors que estão em diferentes arquivos.
