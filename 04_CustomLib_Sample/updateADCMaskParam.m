%PWMGeneratorが持っているマスクパラメータの更新
function updateADCMaskParam(maskObj)

%パラメータ値の取得
ADC_QuantBit_str = maskObj.getParameter('ADC_QuantBit').Value;
MaxRange_str = maskObj.getParameter('MaxRange').Value;
MinRange_str = maskObj.getParameter('MinRange').Value;

%変数の評価実施
ADC_QuantBit= safeEval(ADC_QuantBit_str);
MaxRange = safeEval(MaxRange_str);
MinRange = safeEval(MinRange_str);

%計算の実施
QuantResolution = 1/(2^ADC_QuantBit);
QuantUnit = (MaxRange - MinRange) * QuantResolution;

%更新値を代入
maskObj.getParameter('QuantResolution').Value = num2str(QuantResolution);
maskObj.getParameter('QuantUnit').Value = num2str(QuantUnit);

end


function val = safeEval(expr)
    try
        val = evalin('base', expr);  % ベースワークスペースで評価
        if ~isnumeric(val)
            val = [];
        end
    catch
        val = [];
    end
end