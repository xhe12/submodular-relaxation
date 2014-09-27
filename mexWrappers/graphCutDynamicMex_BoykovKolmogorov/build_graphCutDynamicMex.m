function build_graphCutDynamicMex

mexFlags = ' -largeArrayDims ';
if ~isempty(strfind(mexext, '64'))
    mexFlags = [mexFlags, ' -DA64BITS '];
end
maxFlowPath = 'maxflow-v3.03.src';

 mexFlags = [mexFlags, ' -I', maxFlowPath, ' '];

mexcmd = ['mex  src/graphCutDynamicMex.cpp src/graphCutMemory.cpp ', ...
            [maxFlowPath,'/graph.cpp'], ' ', ...
            [maxFlowPath,'/maxflow.cpp'], ' -output graphCutDynamicMex', mexFlags];
eval(mexcmd);

mexcmd = ['mex src/updateUnaryGraphCutDynamicMex.cpp src/graphCutMemory.cpp ', ...
            [maxFlowPath,'/graph.cpp'], ' ', ...
            [maxFlowPath,'/maxflow.cpp'], ' -output updateUnaryGraphCutDynamicMex', mexFlags];
eval(mexcmd);

mexcmd = ['mex src/deleteGraphCutDynamicMex.cpp src/graphCutMemory.cpp ', ...
            [maxFlowPath,'/graph.cpp'], ' ', ...
            [maxFlowPath,'/maxflow.cpp'], ' -output deleteGraphCutDynamicMex', mexFlags];
eval(mexcmd);
