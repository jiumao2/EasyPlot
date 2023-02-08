function map = Dark2(N)
% MatPlotLib 3.3 配色方案
% 输入:
% N   -  定义colormap长度的整数（N>=0）；若为空，则为当前图窗colormap长度
%
% 输出:
% map -  Nx3的RGB颜色矩阵
%
% Copyright  2020   Akun
% https://zhuanlan.zhihu.com/c_1074615528869531648

if nargin<1
	N = size(get(gcf,'colormap'),1);
else
	assert(isscalar(N)&&isreal(N),'First argument must be a real numeric scalar.')
	assert(fix(N)==N&&N>=0,'First argument must be a positive integer.')
end

C = [0.129411764705882,0.623529411764706,0.462745098039216;0.850980392156863,0.376470588235294,0.156862745098039;0.454901960784314,0.439215686274510,0.694117647058824;0.901960784313726,0.117647058823529,0.545098039215686;0.392156862745098,0.654901960784314,0.262745098039216;0.901960784313726,0.670588235294118,0.133333333333333;0.647058823529412,0.466666666666667,0.168627450980392;0.396078431372549,0.400000000000000,0.396078431372549];

map = C(1+mod(0:N-1,size(C,1)),:);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
% 制作：阿昆            %%%
% 公众号：阿昆的科研日常 %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%