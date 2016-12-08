function flag = in_rect1(xy, rect_info)
% this function is used to test if the rect is in certain rectangle
% specified by rect_info, flag is a bool function
% [x, y, length/2, length_direction, width/2, width_direction,pic#]
% note that 
% Matrix operator version;
n = size(xy,1);
c = zeros(n,4);
c(:,1) = rect_info(:,3) + rect_info(:,1).*rect_info(:,8) - rect_info(:,2).*rect_info(:,7);
c(:,2) = c(:,1) - 2*rect_info(:,3);
c(:,3) = rect_info(:,6) + rect_info(:,1).*rect_info(:,5) - rect_info(:,2).*rect_info(:,4);
c(:,4) = c(:,3) - 2*rect_info(:,6);

x = xy(:,1);
y = xy(:,2);

flag = ((-rect_info(:,8).*x+rect_info(:,7).*y+c(:,1)).*...
        (-rect_info(:,8).*x+rect_info(:,7).*y+c(:,2))<0) &...
        ((-rect_info(:,5).*x+rect_info(:,4).*y+c(:,3)).*...
        (-rect_info(:,5).*x+rect_info(:,4).*y+c(:,4))<0);