classdef ADCCallback

    methods(Static)

        % Following properties of 'maskInitContext' are available to use:
        %  - BlockHandle 
        %  - MaskObject 
        %  - MaskWorkspace: Use get/set APIs to work with mask workspace.
        function MaskInitialization(maskInitContext)
            maskObj = maskInitContext.MaskObject; %マスクワークスペースオブジェクト取得
            %パラメータ更新関数の呼び出し
            updateADCMaskParam(maskObj);
            
        end

        % Use the code browser on the left to add the callbacks.


        function ADC_QuantBit(callbackContext)
            blkHandle = callbackContext.BlockHandle; % Block Handle of this block
            maskObj = Simulink.Mask.get(blkHandle);
            %パラメータ更新関数の呼び出し
            updateADCMaskParam(maskObj);
        end

        function MaxRange(callbackContext)
            blkHandle = callbackContext.BlockHandle; % Block Handle of this block
            maskObj = Simulink.Mask.get(blkHandle);
            %パラメータ更新関数の呼び出し
            updateADCMaskParam(maskObj);
        end

        function MinRange(callbackContext)
            blkHandle = callbackContext.BlockHandle; % Block Handle of this block
            maskObj = Simulink.Mask.get(blkHandle);
            %パラメータ更新関数の呼び出し
            updateADCMaskParam(maskObj);
        end
    end
end