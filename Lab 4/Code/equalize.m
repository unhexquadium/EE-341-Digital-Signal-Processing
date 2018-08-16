
function equalized = equalize(G1, G2, G3, signal)
%G1 is low-frequency gain in dB
%G2 is central-frequency gain in dB
%G3 is high-frequency gain in dB

IIRb1 = [0.0495 0.1486 0.1486 0.0496];
IIRa1 = [1 -1.1619 0.6959 -0.1378];

IIRb2 = [0.1311 0 -0.2622 0 0.1311];
IIRa2 = [1 -0.4824 0.8101 -0.2269 0.2722];

IIRb3 = [0.0985 -0.2956 0.2956 -0.0985];
IIRa3 = [1 0.5772 0.4218 0.0563];

G1 = 10^(G1/20);
G2 = 10^(G2/20);
G3 = 10^(G3/20);

lowPassed = filter(IIRb1, IIRa1, signal)*G1;

bandPassed = filter(IIRb2, IIRa2, signal)*G2;

highPassed = filter(IIRb3, IIRa3, signal)*G3;

equalized = lowPassed + bandPassed + highPassed;
