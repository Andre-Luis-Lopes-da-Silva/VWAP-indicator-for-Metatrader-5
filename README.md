# VWAP-indicator-for-Metatrader-5

Se quiserem usar o indicador dentro de um expert advisor, adicionem: **export** // necessário colocar o export para gerar o arquivo .mqh

Dessa forma: 

int OnCalculate(const int rates_total, const int prev_calculated,
                const datetime &time[], const double &open[],
                const double &high[], const double &low[],
                const double &close[], const long &tick_volume[],
                const long &volume[], const int &spread[]) export // necessário colocar o export para gerar o arquivo .mqh


Quando um arquivo de biblioteca ou de indicador precisa ser exportado em MQL5, é necessário usar a palavra-chave export ao final de funções que precisam ser acessadas fora do arquivo atual, como funções que serão utilizadas em outro arquivo .mqh (header). Sem isso, o código não será acessível para outros arquivos, resultando no erro de não geração do arquivo .mqh.

A palavra-chave export permite que a função seja visível e acessível a partir de outros módulos, como em indicadores ou Expert Advisors que estão em diferentes arquivos.
