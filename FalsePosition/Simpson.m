%Matthew Solomon 
%Simspons 1/3 and trapezoidal code

function [I] = Simpson(x,y)
if numel(x)~= numel(y) 
    error('The x and y vectors are not of equal length')
end
%use the diff equation to calculate the difference between each element in
%an array
   z=diff(x);
   %if spacing is equal throughout the inputed data, then the max
   %difference value should all be the same. By comparing the Max value *
   CC=0*z;
   
   X=max(z)
   CC(1,:)=X;
  
   if max(CC) ~= max(z) || min(CC)~= min(z) || mean(CC) ~= mean(z)
       error('function does not contain evenly spaced values in x row')
   end 
       
   %use size function (x) to measure the length of the row
  
   %use size function (z) to measure length of interval spacing values
   [A,S]=size(x);
   [a,s]=size(z);
   %making a zeros matrix which will be used to sum the integrals
   r=x(1,:)*0;
   %Q/2 will be what tests whether or not the interval contains an even or
   %odd amount of values 
   Q=S/2;
   %is integer will check whether Q/2 is an integer or not 
   if floor(Q) ~= Q
         warning('The interval is odd and the trapezoidal rule will be applied') 
         %use the trapezoidal function to calculate the value of said
         %intervals
       W=(x(S-1)-x(S))*((x(S-1)-x(S)))/2;
       %replace the last valye with the trapezoidal approximation
       r(s)=W;
   end 
     for i=1:s-1;
         if z(i)== z(i+1)
             %p is the value of the simpson rule that will be inserted inti
             %the matrix which will be later added up.
             p=((y(i+1)-y(i))*(y(1)+y(i+1)+y(i+2)))/6;
             r(i)=p;
             i=i+1;
             if floor(Q)~=Q
                 break
             end ;
         
         end 
     
     end 
     %finally sum the matrix values to get a single value.
     %set the sum equal to the estimated integral
         
         I=sum(r);
         
         
 fprintf('The integral is: %d\f', I)



