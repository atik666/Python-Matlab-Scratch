function Energy = EnergyFun(Signal)

for i= 1:size(Signal,2)
Energy(:,i) = sum(abs(Signal(:,i)).^2)/length(Signal);
end

end