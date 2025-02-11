//+------------------------------------------------------------------+
//| Indicador VWAP para MetaTrader 5                                 |
//+------------------------------------------------------------------+
#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1

#property indicator_type1   DRAW_LINE
#property indicator_color1  clrBlue
#property indicator_width1  2

// Buffer para armazenar os valores da VWAP
double vwapBuffer[];

//+------------------------------------------------------------------+
//| Inicialização do indicador                                      |
//+------------------------------------------------------------------+
int OnInit()
{
   // Definir o buffer do indicador
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
   MqlDateTime currentTime;
   TimeToStruct(TimeCurrent(), currentTime); // Obtém a data e hora atuais

   double sumPV = 0.0;
   double sumVolume = 0.0;
   
   for(int i = prev_calculated; i < rates_total; i++)
   {
      MqlDateTime barTime;
      TimeToStruct(time[i], barTime);
      
      // Se a barra não for do dia atual, reinicia o cálculo
      if(barTime.day != currentTime.day || barTime.mon != currentTime.mon || barTime.year != currentTime.year)
      {
         sumPV = 0.0;
         sumVolume = 0.0;
      }
      
      double typicalPrice = (high[i] + low[i] + close[i]) / 3.0;
      double pv = typicalPrice * (double)volume[i]; // Conversão explícita para evitar erro de tipo
      
      sumPV += pv;
      sumVolume += (double)volume[i];
      
      vwapBuffer[i] = (sumVolume == 0) ? 0.0 : (sumPV / sumVolume);
   }
   
   return rates_total;
}
