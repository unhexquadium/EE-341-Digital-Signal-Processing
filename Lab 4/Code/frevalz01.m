function  [poles] = frevalz01(b,a,Ts)

%  function  [poles] = frevalz(b,a,Ts)
%  b = numerator coeffs   b_1 + b_2 z^-1 + ...+ b_nb+1 z^-nb
%  a = denominator coeffs 1   + a_2 z^-1 + ...+ a_na+1 z^-na
%  NOTE            a_1 == 1
%  Ts = time step in impulse response plot (optional)
%
%  The function provides a 2x2 figure with the pole-zero plot, the impulse
%  response (starting at 0, length 50*Ts), and the magnitude and phase
%  of the frequency response. (Unless otherwise specifed Ts := 1.)
%
%  Uses FREQZ(B,A,N) to get the complex frequency response vector H
%  of the filter B/A:
%                              -1                  -nb
%         B(z)   b(1)  +  b(2)z   + ... +  b(nb+1)z
%  H(z) = ---- = --------------------------------
%                          -1                  -na
%         A(z)   1  +  a(2)z    + ... +  a(na+1)
%
%  given the numerator and denominator coefficients in vectors B and A.
%  The frequency response is evaluated over (-pi, pi), and plotted for
%  normalized frequency (-1/2,1/2).

% Changes made by Steve Juranich for better viewing under PC display
% conditions.

% Changes made 1/99 for PC version 5 compatibility:
%    clg changed to clf to clear figure
%    linetype for poles changed from 'xc5' to 'xy'
%    'end' removed from end of function

% Changes made by Mari Ostendorf for better help, less plotting

if(nargin==2),Ts=1;end;
clf; Npts = 1024;

%     Start of P/Z cancelation patch block.
%
%           Patch includes the commenting out of four lines in the two
%           blocks of code following the patch. The functions of these
%           lines are now inside the patch block.

poles  =  [zeros(length(b)-1,1);roots(a)];
Npoles = length(poles);

zzeros  =  [zeros(length(a)-1,1);roots(b)];
Nzzeros = length(zzeros);

while poles(1) == zzeros(1);

      poles  = poles(2:Npoles);
      zzeros = zzeros(2:Nzzeros);
      Npoles = length(poles);
      Nzzeros = length(zzeros);

end

%
%     End of P/Z cancelation patch
%

%     poles  =  [zeros(length(b)-1,1);roots(a)];
Re_p   =  real(poles);
Im_p   =  imag(poles);
A_p    =  abs(poles);
P_p    =  angle(poles);
%     Npoles = length(poles);

%     zzeros  =  [zeros(length(a)-1,1);roots(b)];
Re_z   =  real(zzeros);
Im_z   =  imag(zzeros);
A_z    =  abs(zzeros);
P_z    =  angle(zzeros);
%     Nzzeros = length(zzeros);

% scaling
max_z = max([A_z' A_p' 1.1]);

% Watch out for empty poles or zzeros
if(     (Npoles==0) & (Nzzeros~=0) ),
polar( P_z, A_z, 'mo');hold on;
elseif( (Nzzeros==0) & (Npoles~=0) ),
polar( P_p, A_p,'bx');hold on;
else,
        if max(A_z)>max(A_p),
        polar( P_z, A_z,'mo');hold on;
        polar( P_p, A_p,'bx')
        else,
   polar( P_p, A_p,'bx');hold on;
        polar( P_z, A_z,'mo')
        end
end

[H_w, w] = freqz(b,a,Npts,'whole');
w    = w';
A_w  = abs(H_w)';
PH_w = angle(H_w)';% all rows now

%  default is [0, 2*pi)
%  need to flip to display over [-pi, pi]
A_w  =  [  A_w( Npts/2+1:Npts )  A_w( 1:Npts/2 )];% columns
w    =  [    -w( Npts/2+1:-1:2 )    w( 1:Npts/2 )];
PH_w =  [ PH_w( Npts/2+1:Npts ) PH_w( 1:Npts/2 )];
w    =  [ -1:2/(length(w) -1 ):1];
w    =  w/2;

subplot(221),
% scaling
max_z = max([A_z' A_p' 1.1]);

% Watch out for empty poles or zzeros
if(     (Npoles==0) & (Nzzeros~=0) ),
polar( P_z, A_z, 'mo');hold on;
elseif( (Nzzeros==0) & (Npoles~=0) ),
polar( P_p, A_p, 'bx');hold on;
else,
        if max(A_z)>max(A_p)
        polar( P_z, A_z,'mo');hold on;
        polar( P_p, A_p,'bx')
        else,
        polar( P_p, A_p,'bx');hold on;
        polar( P_z, A_z,'mo')
        end
end

grid

circle = -pi:2*pi/200:pi;
polar(circle, ones(1,length(circle)),'r' );
title('Pole-Zero Plot of Filter')
axis([-max_z,max_z,-max_z,max_z])
hold off;

subplot(222),
h=filter(b,a,[1 zeros(1,49)]);
stem( [0:Ts:49*Ts],h);
title('Impulse Response')

% test for 0 to avoid log0 error message....
for j=1:Npts,
  if (A_w(j)==0) mag(j)=-60;
  else, mag(j)=2*10*log10(A_w(j));  end
end
subplot(223), plot(w, mag,'r')
title('Magnitude Response')
xlabel('Normalized Frequency ')
ylabel('dB')

subplot(224), plot(w, PH_w,'r')
title('Phase Response')
xlabel('Normalized Frequency ')
ylabel('rads')
subplot(111);
