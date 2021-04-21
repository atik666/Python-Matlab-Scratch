subplot(4,2,[1 2])
plot(X097_DE_time(1:1202),'b')
xlim([0 1200])

for i = 3:7
    subplot(4,2,i)
    plot(IMF_DE{1,1}(i,:),'b')
    xlim([0 1200])
end

subplot(4,2,8)
plot(IMF_DE{1,1}(end,:),'b')
xlim([0 1200])
