//+------------------------------------------------------------------+
//| Indicador VWAP para MetaTrader 5                                 |
//+------------------------------------------------------------------+
#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1

#property indicator_type1   DRAW_LINE
#property indicator_color1  clrBlue
#property indicator_width1  2

double vwapBuffer[];

//+------------------------------------------------------------------+
//| Inicialização do indicador                                      |
//+------------------------------------------------------------------+
int OnInit()
{
   SetIndexBuffer(0, vwapBuffer);
   IndicatorSetString(INDICATOR_SHORTNAME, "VWAP");
   return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Cálculo da VWAP para cada candle                                |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total, const int prev_calculated,
                const datetime &time[], const double &open[],
                const double &high[], const double &low[],
                const double &close[], const long &tick_volume[],
                const long &volume[], const int &spread[])
{
   if (rates_total == 0)
      return 0;

   double sumPV = 0.0;
   double sumVolume = 0.0;
   
   MqlDateTime lastBarTime;
   TimeToStruct(time[0], lastBarTime); // Tempo da primeira barra do dia

   for(int i = 0; i < rates_total; i++) // Começa do primeiro candle sempre
   {
      MqlDateTime barTime;
      TimeToStruct(time[i], barTime);

      // Se for um novo dia, resetamos as somas
      if(barTime.day != lastBarTime.day || barTime.mon != lastBarTime.mon || barTime.year != lastBarTime.year)
      {
         sumPV = 0.0;
         sumVolume = 0.0;
      }

      double typicalPrice = (high[i] + low[i] + close[i]) / 3.0;
      double pv = typicalPrice * (double)volume[i];

      sumPV += pv;
      sumVolume += (double)volume[i];

      vwapBuffer[i] = (sumVolume == 0) ? 0.0 : (sumPV / sumVolume);

      // Atualiza a data da última barra processada
      lastBarTime = barTime;
   }
   
   return rates_total;
}
