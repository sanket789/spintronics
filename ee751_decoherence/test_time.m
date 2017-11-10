clc
% i = 0;
% N=nchoosek(1e4,2);
% tic
% for k = 1:N
%     if mod(100*k/N,10)== 0
%         100*k/N
%     end
%     i = i+1;
%     
% end
% i
% N
% 
% toc
QD = InAs_dot(150,150,25,6);
k=0;
p = zeros(size(QD,1),3);
for n = 1:size(QD,1)
    p(n,1) = dot(QD(n,1:3),[1/sqrt(2),0.5,-0.5]);
    p(n,2) = dot(QD(n,1:3),[1/sqrt(2),-0.5,0.5]);
    p(n,3) = dot(QD(n,1:3),[0,1/sqrt(2),1/sqrt(2)]); 
    if QD(n,4) == 0
        k = k+1;
        
    end
end
figure
ax1 = subplot(3,1,1);
plot(ax1,p(:,1))
title(ax1,'x')

ax2 = subplot(3,1,2);
plot(ax2,p(:,2))
title(ax2,'y')

ax3 = subplot(3,1,3);
plot(ax3,p(:,3))
title(ax3,'z')
save QD
