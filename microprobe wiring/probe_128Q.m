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

1	4	0	2050	1
2	20	0	2075	1
3	0	0	2000	1
4	0	0	1950	1
5	20	0	1975	1
6	0	0	1900	1
7	0	0	1850	1
8	20	0	1875	1
9	0	0	1800	1
10	0	0	1750	1
11	20	0	1775	1
12	0	0	1700	1
13	0	0	1650	1
14	20	0	1675	1
15	0	0	1600	1
16	0	0	1550	1
17	0	0	1500	1
18	0	0	1450	1
19	0	0	1400	1
20	0	0	1350	1
21	0	0	1300	1
22	0	0	1250	1
23	0	0	1200	1
24	0	0	1150	1
25	0	0	1100	1
26	0	0	1050	1
27	0	0	1000	1
28	0	0	950	1
29	0	0	900	1
30	0	0	850	1
31	0	0	800	1
32	0	0	750	1
33	0	0	700	1
34	0	0	650	1
35	0	0	600	1
36	0	0	550	1
37	0	0	500	1
38	0	0	450	1
39	0	0	400	1
40	0	0	350	1
41	0	0	300	1
42	0	0	250	1
43	0	0	200	1
44	0	0	150	1
45	0	0	100	1
46	0	0	50	1
47	0	0	0	1
48	20	0	1625	1
49	20	0	1575	1
50	20	0	1475	1
51	20	0	1375	1
52	20	0	1275	1
53	20	0	1175	1
54	20	0	1075	1
55	20	0	975	1
56	20	0	875	1
57	20	0	775	1
58	20	0	675	1
59	20	0	575	1
60	20	0	475	1
61	20	0	375	1
62	20	0	275	1
63	20	0	175	1
64	20	0	75	1
65	20	0	25	1
66	20	0	125	1
67	20	0	225	1
68	20	0	325	1
69	20	0	425	1
70	20	0	525	1
71	20	0	625	1
72	20	0	725	1
73	20	0	825	1
74	20	0	925	1
75	20	0	1025	1
76	20	0	1125	1
77	20	0	1225	1
78	20	0	1325	1
79	20	0	1425	1
80	20	0	1525	1
81	40	0	0	1
82	40	0	50	1
83	40	0	100	1
84	40	0	150	1
85	40	0	200	1
86	40	0	250	1
87	40	0	300	1
88	40	0	350	1
89	40	0	400	1
90	40	0	450	1
91	40	0	500	1
92	40	0	550	1
93	40	0	600	1
94	40	0	650	1
95	40	0	700	1
96	40	0	750	1
97	40	0	800	1
98	40	0	850	1
99	40	0	900	1
100	40	0	950	1
101	40	0	1000	1
102	40	0	1050	1
103	40	0	1100	1
104	40	0	1150	1
105	40	0	1200	1
106	40	0	1250	1
107	40	0	1300	1
108	40	0	1350	1
109	40	0	1400	1
110	40	0	1450	1
111	40	0	1500	1
112	40	0	1550	1
113	40	0	1600	1
114	40	0	1650	1
115	20	0	1725	1
116	40	0	1700	1
117	40	0	1750	1
118	20	0	1825	1
119	40	0	1800	1
120	40	0	1850	1
121	20	0	1925	1
122	40	0	1900	1
123	40	0	1950	1
124	20	0	2025	1
125	40	0	2000	1
126	20	0	2100	1
127	20	0	2125	1
128	36	0	2050	1

];


tipelectrode=58;    %nearest tip-electrode vertical distance in microns.

connector_position='bottom';

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
