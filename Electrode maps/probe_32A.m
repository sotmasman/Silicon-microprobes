%first column = channel number on probe.  Convention is ch. 1 is at top left of PCB
%and number wrap around in counter-clockwise fashion.

%second column = x coordinate, horizontal distance to reference electrode in microns.  Convention is
%for reference electrode to be at bottom left corner of array when array
%points up.

%third column = y coordinate.  Convention is for this coordinate to be zero
%unless the probe is 3D.

%forth column = z coordinate, vertical distance to reference electrode in microns.  Convention is
%for reference electrode to be at bottom left corner of array when array
%points up.

%fifth column = shaft number.  Convention is for shaft 1 to be the
%right-most shaft when array points up.

probewiring=[

1	0	0	930	1
2	0	0	900	1
3	0	0	870	1
4	0	0	840	1
5	0	0	810	1
6	0	0	780	1
7	0	0	750	1
8	0	0	720	1
9	0	0	690	1
10	0	0	660	1
11	0	0	630	1
12	0	0	600	1
13	0	0	570	1
14	0	0	540	1
15	0	0	510	1
16	0	0	480	1
17	0	0	450	1
18	0	0	420	1
19	0	0	390	1
20	0	0	360	1
21	0	0	330	1
22	0	0	300	1
23	0	0	270	1
24	0	0	240	1
25	0	0	210	1
26	0	0	180	1
27	0	0	150	1
28	0	0	120	1
29	0	0	90	1
30	0	0	60	1
31	0	0	30	1
32	0	0	0	1

];


tipelectrode=80;    %nearest tip-electrode vertical distance in microns.

connector_position='top';

find_probewiring



s=[];
s.channels=probewiring(:,1);
s.x=probewiring(:,2);   %the reference electrode is always the top right channel when the probes are pointing up.
s.y=probewiring(:,3);
s.z=probewiring(:,4); s.z=s.z-min(s.z);
s.shaft=probewiring(:,5);
s.tipelectrode=tipelectrode;

if strcmp(headstage_source,'Intan')
    s.channels=s.channels-1;
end

%To plot the labeled channels:
figure(2)
clf
plot(s.x,s.z,'sqr', 'MarkerSize',11)
hold on
for i=1:size(probewiring,1)
text(s.x(i)-5,s.z(i),num2str(s.channels(i)),'FontSize',9)
end
axis([min(s.x)-50 max(s.x)+50 min(s.z)-50 max(s.z)+50])
axis equal
set(gca,'FontSize',10,'TickDir','out')
