%PWMGeneratorが持っているマスクパラメータの更新
function updatePWMMaskParam(maskObj)

%パラメータ値の取得
fsw_str = maskObj.getParameter('fsw').Value;
PWM_Resolution_str = maskObj.getParameter('PWM_Resolution').Value;
DeadTimeRange_str = maskObj.getParameter('DeadTimeRange').Value;

%変数の評価実施
fsw = safeEval(fsw_str);
PWM_Resolution = safeEval(PWM_Resolution_str);
DeadTimeRange = safeEval(DeadTimeRange_str);

%計算の実施
TimerCountMax = 1/ PWM_Resolution;
DeadTime = 1/fsw*PWM_Resolution*DeadTimeRange;

%更新値を代入
maskObj.getParameter('TimerCountMax').Value = num2str(TimerCountMax);
maskObj.getParameter('DeadTime').Value = num2str(DeadTime);

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