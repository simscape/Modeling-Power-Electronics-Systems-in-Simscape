classdef PWMCallback

    methods(Static)

        % Following properties of 'maskInitContext' are available to use:
        %  - BlockHandle 
        %  - MaskObject 
        %  - MaskWorkspace: Use get/set APIs to work with mask workspace.
        function MaskInitialization(maskInitContext)

            maskWS = maskInitContext.MaskWorkspace; %マスクワークスペースオブジェクト取得
            %マスクワークスペースにマスクエディタで指定したパラメータが格納されています。
            %MaskWorkspaceオブジェクトのgetメソッドでパラメータ名を指定して利用することで値を取得できます。
            fsw = maskWS.get('fsw');
            PWM_Resolution = maskWS.get('PWM_Resolution');
            DeadTimeRangeNum = maskWS.get('DeadTimeRange');

            %初期化関数内であれば、マスクパラメータの値を更新したいときにはsetメソッドが利用できます
            maskWS.set("DeadTime",1/fsw*PWM_Resolution*DeadTimeRangeNum);
            maskWS.set("TimerCountMax", 1/ PWM_Resolution);

        end 


        function fsw(callbackContext)
            blkHandle = callbackContext.BlockHandle; % Block Handle of this block
            maskObj = Simulink.Mask.get(blkHandle);
            %パラメータ更新関数の呼び出し
            updatePWMMaskParam(maskObj);
        end

        function PWM_Resolution(callbackContext)
            blkHandle = callbackContext.BlockHandle; % Block Handle of this block
            maskObj = Simulink.Mask.get(blkHandle);
            %パラメータ更新関数の呼び出し
            updatePWMMaskParam(maskObj);
        end

        function DeadTimeRange(callbackContext)
            blkHandle = callbackContext.BlockHandle; % Block Handle of this block
            maskObj = Simulink.Mask.get(blkHandle);
           %パラメータ更新関数の呼び出し　
            updatePWMMaskParam(maskObj);
        end
    end
end