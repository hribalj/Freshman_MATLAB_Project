function Network = genericForceApplication(Network,Networks,func)
    for pointSub = 1:length(Network.pnts)
        for network = 1:length(Networks)
            for pointObj = 1:length(Networks(network).pnts)
                Network.pnts(pointSub).forc = [Network.pnts(pointSub).forc; func(Network.pnts(pointSub),Networks(network).pnts(pointObj) )];
            end
        end
    end
end