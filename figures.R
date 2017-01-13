##########################################################
#          Do everything as a function of t              #
##########################################################
t = seq(0,1/6,0.001)           #vector of non-prohibitive tariff values
                          
PSx = ((2 +2*t)^2)/49
CSx = .5*((3 -4*t)^2)/49
TR = (t - 6*t^2)/7
CSy = ((3 +3*t)^2)/98
PSy = ((4 -3*t)^2)/98
                          
gtn = (68*t + 5)/(8*(1+t))    #gamma as fcn of tau, unilateral maximization

#some values of tau are so low that gamma would be less than one
gtn2 = matrix(0,length(gtn),1)

for (j in 1:length(gtn)) {
  x = gtn[j]
  gtn2[j] = max(x,1)
}  

W = CSx + gtn2*PSx + CSy + PSy + TR  #partially weighted welfare
plot(t,W, type = "l",xlab = "Tariff",ylab = "Gov't Welfare")

e = (gtn2 - 1)^10
W2 = CSx + gtn2*PSx + CSy + PSy + TR - e  #partially weighted welfare - e
plot(t,W2, type = "l",xlab = "Tariff",ylab = "Gov't Welfare")

                          
##########################################################
#               Unconverted Matlab code                  #
##########################################################
# Create figure for weighted function
figure1 = figure('Color',[1 1 1]);
                          
# Create axes
axes1 = axes('Parent',figure1);
                          
# set X-limits of the axes
xlim(axes1,[0 1/6]);
# set Y-limits of the axes
ylim(axes1,[0.0854 0.087]);
box(axes1,'on');
hold(axes1,'all');
                          
# Create multiple lines using matrix input to plot
plot1 = plot(t,[W],'Parent',axes1,'LineWidth',1);
set(plot1(1),'DisplayName','Trade Agreement Tariffs',...
'Color',[0 0 0]);
                          
# Create title
#title('Government Welfare with Weighted Objective Function',...
'FontWeight','demi',...
'FontSize',12);
                          
# Create xlabel
xlabel('\tau','FontSize',12);
                          
# Create ylabel
ylabel('Government Welfare','FontSize',12);
                          
# Create figure for unweighted function
figure1 = figure('Color',[1 1 1]);
                          
# Create axes
axes1 = axes('Parent',figure1);
                          
# set X-limits of the axes
xlim(axes1,[0 1/6]);
# set Y-limits of the axes
ylim(axes1,[0.42 0.5]);
box(axes1,'on');
hold(axes1,'all');
                          
# Create multiple lines using matrix input to plot
plot1 = plot(t,[W2],'Parent',axes1,'LineWidth',1);
set(plot1(1),'DisplayName','Trade Agreement Tariffs',...
    'Color',[0 0 0]);
                          
# Create title
%title('Government Welfare with Weighted Objective Function',...
       'FontWeight','demi',...
       'FontSize',12);
                          
# Create xlabel
xlabel('\tau','FontSize',12);
                          
# Create ylabel
ylabel('Government Welfare','FontSize',12);


##########################################################
#          OLD CODE as a function of gamma               #
##########################################################
g = seq(1,7/4,0.001)

W = 9/98 + 8*g/98 + ((8*g - 8)/49)*(8*g - 5)/(4*(17-2*g)) + (2*(2*g-17) + 9)/49 * (8*g - 5)/(4*(17-2*g))^2;

plot(g,W)

%unilateral
t = (8*g - 5)/(4*(17-2*g))
gtn = (68*t + 5)/(8*(1+t))

PSx = ((2 +2*t)^2)/49;
CSx = 5*((3 -4*t)^2)/49;
TR = (t - 6*t^2)/7;
CSy = ((3 +3*t)^2)/98;
PSy = ((4 -3*t)^2)/98;

w = 1./(4+gtn);
w = 1

W2 = w*CSx + gtn*w*PSx + w*CSy + w*PSy + w*TR
plot(g,W2)

%efficient tariff
te = (4*g - 4)./(25-4*g);
gte = (25*t + 4)./(4+4*t);

PSxe = ((2 +2*te).^2)/49;
CSxe = .5*((3 -4*te).^2)/49;
TRe = (te - 6*te.^2)/7;
CSye = ((3 +3*te).^2)/98;
PSye = ((4 -3*te).^2)/98;

w = 1./(4+g);

We = w.*CSxe + g.*w.*PSxe + w.*CSye + w.*PSye + w.*TRe;
plot(g,We);