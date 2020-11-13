--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-4)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: athlete_team_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.athlete_team_links (
    ath_id integer,
    team_id integer
);


--
-- Name: athletes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.athletes (
    id integer,
    name text
);


--
-- Name: individual_performances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.individual_performances (
    id integer,
    ath_id integer,
    meet_id integer,
    team_id integer,
    place integer,
    "time" real
);


--
-- Name: meets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meets (
    id integer,
    name text,
    year integer,
    location text
);


--
-- Name: team_performances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team_performances (
    id integer,
    place integer,
    points integer,
    team_id integer,
    meet_id integer
);


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    id integer,
    name text,
    location text
);


--
-- Data for Name: athlete_team_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.athlete_team_links (ath_id, team_id) FROM stdin;
1	7
2	5
3	2
4	3
5	9
6	5
7	2
8	3
9	10
10	6
11	10
12	3
13	2
14	6
15	5
16	2
17	10
18	5
19	3
20	5
21	6
22	1
23	3
24	1
25	6
26	3
27	10
28	5
29	9
30	5
31	6
32	4
33	5
34	10
35	1
36	4
37	7
38	4
39	7
40	5
41	11
42	1
43	11
44	3
45	2
46	5
47	10
48	6
49	7
50	1
51	4
52	6
53	3
54	6
55	9
56	6
57	1
58	2
59	2
60	1
61	3
62	6
63	2
64	4
65	7
66	5
67	4
68	2
69	3
70	7
71	7
72	5
73	6
74	2
75	7
76	4
77	3
78	6
79	9
80	2
81	3
82	4
83	3
84	11
85	9
86	8
87	8
88	2
89	3
90	10
91	6
92	1
93	11
94	3
95	3
96	11
97	5
98	11
99	3
100	7
101	6
102	4
103	10
104	11
105	9
106	8
107	7
108	8
109	3
110	1
111	10
112	2
113	8
114	1
115	11
116	6
117	8
118	9
119	6
120	10
121	1
122	8
123	7
124	4
125	6
126	7
127	10
128	11
129	1
130	10
131	8
132	1
133	1
134	8
135	7
136	4
137	5
138	1
139	2
140	6
141	3
142	4
143	8
144	10
145	3
146	6
147	8
148	2
149	3
150	1
151	6
152	7
153	2
154	7
155	3
156	11
157	3
158	9
159	6
160	6
161	6
162	1
163	6
164	6
165	4
166	8
167	6
168	8
169	8
170	6
171	6
172	6
173	6
174	9
175	10
176	3
177	8
178	9
179	1
180	2
181	11
182	9
183	6
184	3
185	4
186	6
187	1
188	7
189	6
190	10
191	4
192	4
193	7
194	1
195	8
196	7
197	8
198	4
199	3
200	6
201	8
202	8
203	9
204	8
205	8
206	4
207	6
208	1
209	3
210	9
211	3
212	3
213	1
214	3
215	3
216	10
217	6
218	2
219	8
220	6
221	3
222	7
223	3
224	2
225	2
226	11
227	2
228	4
229	3
230	9
231	4
232	3
233	10
234	4
235	6
236	5
237	6
238	8
239	1
240	2
241	5
242	1
243	3
244	11
245	8
246	6
247	3
248	4
249	3
250	1
251	3
252	11
253	6
254	3
255	3
256	6
257	9
258	8
259	9
260	6
261	2
262	6
263	6
264	3
265	8
266	1
267	6
268	6
269	8
270	6
271	6
272	3
273	9
274	6
275	6
276	7
277	3
278	5
279	2
280	4
281	7
282	6
283	9
284	1
285	4
286	10
287	9
288	11
289	8
290	9
291	9
292	3
293	8
294	4
295	8
296	8
297	1
298	11
299	4
300	3
301	1
302	6
303	10
304	6
305	8
306	6
307	6
308	3
309	7
310	7
311	9
312	9
313	3
314	3
315	9
316	4
317	8
318	1
319	8
320	7
321	8
322	9
323	6
324	3
325	3
326	3
327	9
328	7
329	4
330	11
331	3
332	6
333	2
334	3
335	9
336	5
337	7
338	9
339	3
340	4
341	1
342	8
343	9
344	8
345	3
346	3
347	6
348	3
349	10
350	3
351	4
352	3
353	2
354	1
355	6
356	2
357	4
358	3
359	10
360	6
361	5
362	3
363	7
364	3
365	2
366	3
367	2
368	6
369	5
370	1
371	11
372	8
373	9
374	9
375	6
376	6
377	7
378	5
379	3
380	6
381	1
382	6
383	7
384	4
385	6
386	4
387	3
388	8
389	3
390	3
391	3
392	11
393	3
394	7
395	8
396	3
397	1
398	1
399	7
400	1
401	8
402	8
403	5
404	3
405	8
406	4
407	9
408	6
409	6
410	4
411	9
412	11
413	3
414	3
415	8
416	4
417	4
418	6
419	5
420	7
421	8
422	8
423	4
424	3
425	2
426	3
427	3
428	6
429	5
430	6
431	3
432	3
433	7
434	2
435	10
436	1
437	3
438	6
439	2
440	5
441	2
442	9
443	3
444	11
445	2
446	3
447	6
448	6
449	6
450	6
451	11
452	2
453	3
454	6
455	5
456	2
457	1
458	7
459	10
460	3
461	9
462	4
463	6
464	6
465	1
466	3
467	2
468	6
469	1
470	6
471	11
472	9
473	3
474	4
475	2
476	2
477	2
478	7
479	3
480	10
481	6
482	1
483	4
484	3
485	5
486	3
487	8
488	4
489	6
490	3
491	9
492	5
493	6
494	3
495	6
496	1
497	3
498	4
499	11
500	4
501	3
502	3
503	6
504	6
505	4
506	10
507	9
508	8
509	7
510	7
511	2
512	7
513	9
514	6
515	7
516	3
517	1
518	10
519	2
520	8
521	2
522	1
523	11
524	4
525	6
526	2
527	9
528	1
529	3
530	9
531	9
532	6
533	8
534	1
535	7
536	2
537	4
538	4
539	6
540	4
541	6
542	11
543	5
544	2
545	2
546	3
547	10
548	8
549	5
550	8
551	1
552	8
553	2
554	3
555	4
556	6
557	2
558	8
559	5
560	10
561	4
562	2
563	6
564	2
565	3
566	7
567	8
568	6
569	11
570	10
571	6
572	3
573	2
574	11
575	1
576	9
577	2
578	6
579	11
580	6
581	4
582	2
583	6
584	8
585	1
586	4
587	4
588	10
589	1
590	2
591	3
592	6
593	6
594	7
595	9
596	6
597	6
598	6
599	9
600	9
601	3
602	6
603	7
604	7
605	8
606	6
607	6
608	9
609	8
610	9
611	8
612	6
613	8
614	6
615	9
616	1
617	2
618	9
619	3
620	3
621	10
622	3
623	3
624	5
625	1
626	6
627	9
628	3
629	2
630	11
631	6
632	9
633	2
634	6
635	1
636	1
637	3
638	4
639	1
640	2
641	2
642	8
643	3
644	3
645	2
646	9
647	1
648	4
649	6
650	7
651	6
652	4
653	9
654	6
655	5
656	7
657	2
658	10
659	3
660	5
661	3
662	3
663	3
664	7
665	3
666	5
667	1
668	4
669	1
670	7
671	6
672	1
673	5
674	6
675	11
676	1
677	6
678	3
679	6
680	3
681	10
682	4
683	4
684	6
685	6
686	11
687	6
688	4
689	8
690	6
691	6
692	9
693	4
694	7
695	6
696	10
697	7
698	10
699	1
700	10
701	7
702	2
703	3
704	7
705	2
706	2
707	3
708	1
709	2
710	2
711	3
712	7
713	7
714	5
715	9
716	6
717	2
718	4
719	3
720	2
721	3
722	2
723	1
724	7
725	3
726	2
727	11
728	6
729	6
730	6
731	3
732	5
733	8
734	7
735	9
736	1
737	8
738	3
739	3
740	6
741	6
742	4
743	6
744	3
745	9
746	7
747	6
748	2
749	4
750	3
751	3
752	5
753	1
754	9
755	1
756	3
757	4
758	3
759	6
760	8
761	1
762	2
763	6
764	1
765	9
766	4
767	2
768	1
769	10
770	6
771	5
772	4
773	10
774	9
775	8
776	1
777	2
778	4
779	4
780	1
781	9
782	9
783	5
784	9
785	8
786	11
787	10
788	8
789	4
790	4
791	6
792	1
793	4
794	3
795	5
796	5
797	7
798	9
799	2
800	8
801	2
802	6
803	3
804	9
805	3
806	7
807	2
808	1
809	7
810	4
811	4
812	9
813	1
814	2
815	6
816	3
817	2
818	4
819	2
820	1
821	3
822	9
823	3
824	3
825	7
826	1
827	1
828	3
829	9
830	4
831	1
832	1
833	7
834	4
835	3
836	3
837	11
838	4
839	8
840	2
841	2
842	10
843	7
844	9
845	6
846	3
847	6
848	9
849	6
850	5
851	3
852	8
853	3
854	3
855	4
856	2
857	4
858	6
859	10
860	8
861	5
862	10
863	8
864	4
865	11
866	5
867	10
868	10
869	1
870	4
871	1
872	5
873	5
874	7
875	7
876	2
877	3
878	3
879	4
880	7
881	4
882	8
883	7
884	6
885	6
886	9
887	4
888	6
889	7
890	6
891	8
892	4
893	8
894	7
895	9
896	3
897	11
898	11
899	1
900	3
901	6
902	7
903	3
904	3
905	3
906	8
907	10
908	1
909	3
910	3
911	6
912	9
913	5
914	4
915	11
916	3
917	11
918	3
919	1
920	4
921	2
922	3
923	5
924	10
925	1
926	9
927	10
928	6
929	4
930	7
931	2
932	3
933	7
934	9
935	6
936	7
937	9
938	6
939	6
940	7
941	4
942	5
943	7
944	8
945	9
946	3
947	5
948	8
949	9
950	3
951	11
952	2
953	1
954	2
955	3
956	7
957	1
958	7
959	2
960	4
961	10
962	8
963	4
964	4
965	4
966	6
967	2
968	1
969	3
970	2
971	6
972	9
973	2
974	6
975	2
976	9
977	3
978	4
979	4
980	4
981	7
982	5
983	6
984	7
985	2
986	3
987	6
988	7
989	8
990	6
991	4
992	4
993	1
994	5
995	1
996	1
997	7
998	2
999	3
1000	6
1001	7
1002	9
1003	4
1004	2
1005	9
1006	3
1007	10
1008	3
1009	1
1010	7
1011	6
1012	3
1013	2
1014	11
1015	4
1016	8
1017	3
1018	3
1019	3
1020	5
1021	9
1022	5
1023	4
1024	6
1025	3
1026	2
1027	2
1028	3
1029	1
1030	6
1031	3
1032	1
1033	3
1034	1
1035	2
1036	2
1037	10
1038	1
1039	2
1040	6
1041	1
1042	5
1043	8
1044	8
1045	4
1046	3
1047	1
1048	8
1049	3
1050	8
1051	7
1052	2
1053	2
1054	1
1055	5
1056	1
1057	6
1058	3
1059	6
1060	6
1061	10
1062	3
1063	2
1064	4
1065	10
1066	4
1067	8
1068	11
1069	7
1070	1
1071	5
1072	4
1073	2
1074	6
1075	1
1076	11
1077	3
1078	7
1079	1
1080	9
1081	4
1082	11
1083	8
1084	2
1085	4
1086	2
1087	9
1088	6
1089	6
1090	3
1091	5
1092	8
1093	7
1094	8
1095	4
1096	10
1097	8
1098	9
1099	10
1100	4
1101	4
1102	8
1103	5
1104	8
1105	10
\.


--
-- Data for Name: athletes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.athletes (id, name) FROM stdin;
1	Dan Greeno
2	Ian Bauer
3	Ben Sathre
4	Jacob Marotz
5	Wade Ekstrom
6	Devin Monson
7	Brian Sames
8	Ruon Dobuol
9	Brent Haglund
10	Dustin Franta
11	Ben Rodriguez
12	Ben Wilson
13	Mike Connell
14	Patrick Lowder
15	Jamison Hull
16	Tyler Iverson
17	Shane Wyborny
18	Ellis Richardson
19	Chris Massey
20	Andy Johnson
21	David Forster
22	Charlie Gamble
23	Jon Lambert
24	John Davis
25	Ruairi Moynihan
26	Adrian Swanson
27	Matt Schafer
28	Ian Campbell
29	Carl Biggers
30	Colin Rogers
31	Ryan Noack
32	Nick Ross
33	Nate Walker
34	Victor Sanchez
35	Bobby Davis
36	John Kennedy
37	Zach Haskins
38	Max Hanson
39	Denny Meints
40	Nate Dobbins
41	David Feather
42	Josh Campbell
43	Peter Borash
44	Andrew Nussbaum
45	Brian Farley
46	Joel Dieterich
47	Geoff Gillmor
48	Jordan Fladland
49	Sam Greeno
50	Colin Sinclair
51	Mark Hartman
52	Andrew Stevens
53	Chris Rivers
54	Andrew Clasen
55	Dale Dybvig
56	Matt Harren
57	Chris Marshall
58	Greg Dowe
59	Crawford Hubbell
60	Blake Hansen
61	Tim Lillehaugen
62	Tom Hoffman
63	Pat Bryant
64	Carson Smith
65	Austin Hinrichs
66	Jack Deichert
67	Jeremy Kuhn
68	Nick Michalak
69	Perk Perkovich
70	Joel McDougall
71	Brian Anderson
72	Chris Reisdorfer
73	Josh Gunderson
74	Jim Leschke
75	Andrew Boeddeker
76	Alex Thornton
77	Daniel Friedrichsen
78	Grant Cook
79	Nick Mangigian
80	Stu Lombardo
81	Josh Wold
82	Mark Bartley
83	Kellen McMillen
84	John Vallez
85	Adrian St Francis
86	Paul Lillehaugen
87	Mike Reponen
88	George Williams
89	Brian Tomlinson
90	Ryan Norman
91	Steven Lubner
92	Dylan Cheever
93	Robby McGuire
94	Reid Gilbertson
95	Pat Boland
96	Quentin Moore
97	Brendan Ruter
98	Michael Mockler
99	Joe Paille
100	Brent Schultz
101	Paul Schoeneberger
102	Adam Lund
103	Zach Stevens
104	Ben Carlson
105	Jon Bassen
106	Ben Jacobson
107	Greg Moravec
108	Brandon Huether
109	Aron Block
110	Kian Flynn
111	Austin Erickson
112	Tony Gerten
113	Brad McConn
114	Jon Kittaka
115	Benton Kodet
116	Tyler Etheridge
117	Luke Olmstead
118	Avery Bowran
119	Ryan Miller
120	Jason Chrudimsky
121	Michael Sanders
122	Matt Mehr
123	Matt McKeever
124	Cristian Raether
125	Collin Hager
126	Justin Ivory
127	Joe Arnold
128	Mike Wolter
129	Adam Scherling
130	Ethan Gutzmann
131	David Ohmann
132	Aaron Hirsh
133	Chas Karch
134	Ben Ehlers
135	Nick Krinkie
136	Jon Kasprisin
137	Ross Anderson
138	Michael Knudson
139	Nick Johnson
140	John Collier
141	Mike Mittelsteadt
142	Jeremy Bock
143	Adam Fitzgerald
144	Dan Gerber
145	Fankie Heller
146	Peter Schoen
147	Spencer McCombs
148	Allan Kroyer
149	Ian Nystrom
150	Reid McMurry
151	Robert Gerten
152	Jp Cartier
153	Will Roberson
154	Alex Stewart
155	Ryan Powley
156	Ryan Winegardner
157	Bryan Hulse
158	Collin Cousins
159	Michael Jaeger
160	Michael Kuhlman
161	Joe Kilkus
162	Ben Parks
163	Eric Larson
164	Nathan Amberg
165	Mark Petersen
166	Zach Davis
167	Todd Alle
168	Ben Fraase
169	Eric Juven
170	Patrick Sitzer
171	Dan Maxbauer
172	Joe Gair
173	Kaleb Johnson
174	Joe Macula
175	Austin Wagner
176	Chris Bowman
177	David Haugen
178	Carl Petri
179	Andy Hardt
180	John Leonard
181	Colin Sheehan
182	Ryan Sutley
183	Luke Merickel
184	Peter Ohm
185	Ben Whalen
186	Hans Gunness
187	Evan Johnson
188	Spencer Hinseth
189	Matt Clasen
190	Will Matchett
191	Andrew Nelson
192	Michael Douglas-White
193	Luke Rustad
194	Joe Marren
195	Jake Rhode
196	Justin Brunkow
197	Brad Johnson
198	Eric Bly
199	Steve Krouse
200	Robert Bruening
201	Andrew Overson
202	Nate Korf
203	Joe O'Neil
204	Tyler Nelson
205	Tom Sederquist
206	Anders Bowman
207	Matt Scherber
208	Marcus Huderle
209	Anders Nienstaedt
210	Auburn Jimenez
211	Brian Saksa
212	John Christian
213	Guthrie Cunningham
214	Ben Bayer
215	Matt Perkovich
216	Micheale Tesema
217	John Subialka
218	Seth Rosvold
219	Tanner Sakrismo
220	Nate Engel
221	Nick Evens
222	Matt Neufeld
223	Eric Klein
224	William Manaker
225	Cj Seifert
226	John Soucheray
227	Ethan Armbruster
228	Preston Tomlinson
229	Aaron Thompson
230	Peter Steele
231	Chad Claybaugh
232	Dillon Davis
233	Dakota Darkstar
234	Kurt Prieve
235	Jimmy Backes
236	Joe Fisketti
237	Connor Gjevre
238	Michael Dunn
239	Matt Harrison
240	John Taylor
241	Charles Schweitzer
242	Jacob Hoerger
243	Christian Folken
244	Jake Traxler
245	Jacob Stunek
246	Justin Rose
247	Mike Roth
248	Eric Jorgenson
249	Tim Erickson
250	Matthew Fitzgerald
251	Stefan Lemke
252	Cole Volkman
253	Austin McCoy
254	Andrew Kleven
255	Daniel Bakken
256	Justin Jurek
257	Eric Biggers
258	Matt Barrett
259	Oliver St John
260	Tyler Berndt
261	Zach Brintz
262	Duncan Secor
263	James Alpers
264	Ian O'Neill
265	Scott Anderson
266	Brian Spisiak
267	Nick Peterson
268	Mark Greci
269	Alex Jorgenson
270	Willie Versen
271	Conner Griffin
272	Frankie Heller
273	Mark Riegel
274	Alex Trujillo
275	Max Tusa
276	Mark Bostrom
277	Adam Napolitano
278	David Ohman
279	John Gard
280	Sam Fransen
281	Brandon RichardWebster,
282	Kevin Healy
283	Dan Voss
284	Ryan Lawrence
285	Ben Weiner
286	Hunter Melius
287	Carlos Martinez
288	Erik Germundsen
289	Andy Rothfusz
290	Joe Schubert
291	Terence Steinberg
292	Lucas Foley
293	John Amundson
294	Joseph Renier
295	Erik Slette
296	Jeff Emery
297	Michael Tolan
298	David Lunzer
299	Anders Culver
300	Kyle Obermann
301	Cooper Dodds
302	Bryton Overton
303	Adam Carlsen
304	Joe Dooher
305	Jordan Ringquist
306	Cody Voll
307	Mark Steingraeber
308	Andrew Fuglestad
309	Andrew Zabel
310	Cody Howe
311	David Ellison
312	Palmer Fliss
313	Steven Krouse
314	Dan Wilson
315	Spencer Retelle
316	Nick Neutkens
317	Caleb Giesen
318	Phil Juda
319	Loren Johnson
320	Sam Espey
321	Eric Steuck
322	Nat Froiland
323	Patrick Thornton
324	Logan Johnson
325	Grant Wintheiser
326	Patrick Boland
327	Joe Giamberdino
328	Matt Berens
329	Dillon Emo
330	Aaron Haley
331	Bjorn Thompson
332	Andy Clasen
333	Ben Rascher
334	Kellen McMillan
335	Ben Mayhew
336	Chris Gill
337	Austin Woetzel
338	Mike Waltman
339	Andy Kleven
340	Leighton Becher
341	Thor Laack-Veeder
342	Ryan Sederquist
343	Andy Keefe
344	Jake Stunek
345	Paul Berg
346	Evan Olson
347	Ricky Devine
348	Scott Haidet
349	Brian Byrnes
350	Phil Meyer
351	Tanner Davenport
352	Eric Mueller
353	Robby Williams
354	Noah Laack-Veeder
355	Colin Charpentier
356	Paul Frekot
357	Joesph Renier
358	Zach Greimann
359	Luke Iverson
360	Kyle Rossow
361	Shane Harlow
362	Colton Rod
363	Chris Bernard
364	Dan Bakken
365	Scott Fusco
366	Chris Folken
367	Dan Kremer
368	Bob Gerten
369	Ryan Peterson
370	Connor Jackson
371	Tom Sigwalt
372	Andreas Rekdahl
373	Ollie St John
374	Alex Weberg
375	Scott Dick
376	Steven Donahue
377	Kyle Froeber
378	Andrew Labeau
379	Gus Demann
380	Connor Franta
381	Bill Grimm
382	James McLean
383	Harrison Hitt
384	Schuyler Canfield
385	Dan Philpot
386	Matt Carlson
387	Miles Ross
388	Tim Peterson
389	Zach Bice
390	Erik Gartland
391	Danny Wilson
392	Andy Meyer
393	Drew Fuglestad
394	Dan Minea
395	John Buckanaga
396	Kyle Wagener
397	Gustav Danielsson
398	Ben Levy
399	Alex Hintz
400	Oliver Heywood
401	Luke Lagergren
402	Howard Mukanda
403	Derek Ballandby
404	Jordan Pesik
405	Joe Fischer
406	Ryan McInturf
407	Alan Farnsworth
408	Jeremy Welters
409	Patrick Armstrong
410	Nick Theisen
411	Dylan Saul
412	Ryan Weiss
413	Alex Phearman
414	Russell Brown
415	Henry Dobbs
416	Andy Pettengill
417	Prestin Schwichtenberg
418	Logan Schwinghammer
419	Michaeljon Hayden
420	Brandon Richardwebster
421	Mitch Messner
422	Alex Benzegala
423	Devon Bealke
424	Ian Miles
425	Keaton Wendroth
426	Jake Campbell
427	Calvin Lehn
428	Thomas Feichtinger
429	Nathan Rock
430	Preston Zimny
431	Paul Escher
432	Phillip Meyer
433	Matthew Poss
434	Tyler Krpan
435	Nate Rue
436	Joe Haase
437	Jack Inglis
438	Scott Sippel
439	Nick Letourneau
440	Cole Konczal
441	Alex Schroeder
442	Trevor Maggart
443	Charlie Baird
444	Jase Pater
445	Nick Jackson
446	Evan Kendall
447	Lukas Buehler
448	Caleb LeClaire
449	Jake Burr
450	Andrew Hansen
451	Gabe Thiel
452	Josh Schaffer
453	Spencer Castillo
454	Thomas Friebe
455	Andrew LeBeau
456	Sam Bach
457	Hart Hornor
458	Thomas Ritter
459	Ahmed Nur
460	Michael Roth
461	Michael Kreher
462	Nathan Hanson
463	Michael Greenstein
464	Peter Metzdorff
465	Porter Truax
466	Cal Knickerbocker
467	Ben Long
468	Austin Lick
469	Evan Olawsky
470	Luke Wittman
471	Mitchell McNamara
472	Zach Gilfix
473	Zac Meer
474	Quad Kilander
475	Dylan Baumann
476	Daniel Burkhardt
477	Chad Hewitt
478	Christian Svennes
479	Adam Wood
480	Eric Sanchez
481	Chris Mergens
482	Ben Hiskes
483	Thomas Brenberg
484	Andy Olson
485	Kade Fitzgerald
486	Paul Dau
487	Taylor Lauermann
488	Emilio Quintana
489	Thomas Dierberger
490	Jason Showers
491	Alec Shub
492	Chris Lagergren
493	Pat Martin
494	Adam Sturtz
495	Isaac Secor
496	Tanner Fliss
497	Nate LaFond
498	Thomas Almen-Dale
499	Alex Davis
500	Alex Johnson
501	Timothy Erickson
502	Brian Klein
503	Isaac Winters
504	Carter Gjevre
505	Sam Renier
506	Chase Grieves
507	Noah Borochoff-Porte
508	Andrew Rothfusz
509	Matt Bostrom
510	Zach Leonard
511	Jonathon Chalupsky
512	Logan Eckert
513	Eivind Bakke
514	Michael Collins
515	Erik Beck
516	Jake Brown
517	Jonah Barry
518	Mohamed Mohamed
519	Jacob Gehartz
520	Matthew Lillehaugen
521	Trevor Smith
522	Ben Withbroe
523	Jovan Newsum
524	Thomas Knobbe
525	Maxwell Kuzara
526	Tom Dolan
527	Ross Boehme
528	Nick Carlsen
529	Sean Bjork
530	Lachlan Hinwood
531	Alex Ropes
532	Nick Traxler
533	Carl Wahlin
534	Walter Edstrom
535	Connor Haugen
536	Grant Suttie
537	Evan Jones
538	Paul Nordquist
539	Brandon Franta
540	Carston Dammann
541	Sam Friesen
542	Gabe J Thiel
543	James Logan
544	Mike Ryan
545	Matt Lepisto
546	Jacob Eggers
547	Ryan Cook
548	Ethan Spittle
549	Ronnie Stimson
550	Phil Manley
551	Jack Noble
552	Cody Bekkerus
553	Kevin Schreiber
554	Jake Greeneway
555	John Benson
556	Michael Greensten
557	Tom Linder
558	Aaron Larkin
559	Tyler Lerbakken
560	Andrew McGillivary
561	Alex Fredrickson
562	Ryan Trapp
563	Zach Dietz
564	Adam Brandt
565	Joe Coffey
566	Caleb Knox
567	Tyler Pederson
568	Ryan Bugler
569	Jase E Pater
570	Chris Huss
571	Alex Charbonneau
572	Alex Kunz
573	Casey Halbmaier
574	Alex D Davis
575	Patrick O'Reilly
576	Spencer Nelson
577	Charlie Jones
578	Joseph Rabaey
579	Sherman Moga
580	Zach Bigaouette
581	William Jones
582	Austin Knowlton
583	Robert Lawrence
584	Peter Simon
585	William Hall
586	Connor Medvec
587	Austin Zollner
588	Luke Erickson
589	Michael Trenerry
590	Manny Santana
591	Ben Neubecker
592	David Huss
593	Paul Kohner
594	Matt Berka
595	Ben Bartenstein
596	Michael Wendtlandt
597	Michael Swearingen
598	Zach Grieves
599	James Innelli
600	Kemal Kirchmeier
601	Sam Longenbach
602	Mitchell Ergen
603	Eddi Flores
604	Keenan Pearson
605	Daniel Schneck
606	Erik Ternsjo
607	Maxwell Olson
608	Tayeb Zaidi
609	Will Corbett
610	Seth Loeffler-Kemp
611	Gunnar Vraa
612	Kevin Knutson
613	Nathaniel Harrison
614	Taylor Nauman
615	Peter Talen
616	Donson Cook-Gallardo
617	Jacob Gerhartz
618	joe Giamberdino
619	Paul Timm
620	Keith Ketola
621	Abdullahi Salan
622	Zach Hinz
623	David Ellenberger
624	Andy Magnuson
625	Ryan Hanselman
626	Beau Gerding
627	Erik Alfvin
628	Michael Wegter
629	Andrew Fritz
630	Austin O'Hare
631	Matthew Burgstahler
632	Alexander Ropes
633	Tim Van Laarhoven
634	Keegan Conrad
635	Zach Edinburgh
636	David McKinley
637	Nick Sokolowski
638	Marcus Speca
639	Michael Hoffert
640	Adam Berkowitz
641	Ian Bramstedt
642	Brendan Johnson
643	Henry Burt
644	Nate Webster
645	Taylor Voit
646	Nolan Ebner
647	Hiroshi Nakajima
648	Ryley Sandberg
649	Nick Rethemeier
650	Marcus Danner
651	Charlie Raasch
652	Iain McCrory
653	Nate Merrill
654	Michael Nelson
655	Anthony Paladie
656	Taylor Huffman
657	Ryan Garrett
658	Ibrahim Barqadle
659	Syver Johansen
660	Tommy Rusco
661	Joey Chmelik
662	Eric Bakken
663	Andy Rudberg
664	David Huffman
665	Mitchell Miller
666	Sam Jewson
667	Ernest Polania-Gonzalez
668	Josh Blankenship
669	Camden Sikes
670	Nick Lowery
671	Hunter Elgren
672	Andrew Ruvkun
673	Sean Ahlness
674	Andrew McIntyre
675	Brandon Krogman
676	Paul Kirk-Davidoff
677	Nathan Libra
678	Dan Buchmeier
679	Matt Rengo
680	Derek DeBlieck
681	James Westby
682	Eric Wagner
683	Justin Friedrich
684	Marty McGuire
685	Lukas Pitzl
686	Andrew Markert
687	Joseph Wattenhofer
688	Emmett Haberman
689	Ryan Turner
690	Grant Olsen
691	Hunter Huntoon
692	Alex Gordon
693	Joel Malwitz
694	Andrew Hed
695	Kevin Dudley
696	Austen Wek
697	James Woolley
698	Tedros Kifle
699	Justin Deffenbacher
700	Sean Adams
701	Zac Wright
702	Ephraim Bird
703	Alex Berhe
704	Evan Hatton
705	Parker Rosenau
706	Sam Ivanecky
707	Tayler Aarness
708	Tris Dodge
709	Seth Glidewell
710	Tim Van
711	William Anderson
712	Tom Ritter
713	Andres Rasmussen
714	Tony Duchenes
715	Mac Doherty
716	Henry Boettcher
717	Daniel Mahota
718	Alex Wischnack
719	Andrew Plumb
720	Zach Glasgow
721	Justin Furcich
722	Allen-Michael Burback
723	Cullen Irvine
724	Sam Nelson
725	Thomas Lerdall
726	Richard Peterson
727	Sherm Moga
728	Andrew Berg
729	Daniel Zoltek
730	Dan Allen
731	Stuart Gordon
732	Kyle Mehrhof
733	Race Heitkamp
734	Tim Huss
735	Chris Boranian
736	Jonah Shaw
737	Brandon Quibell
738	Alec Kirtley
739	Liam Getzloff
740	Will Zimmerman
741	Kevin Lamb
742	John Surber
743	Jake Kirsch
744	Thomas Bissen
745	Spencer Grant
746	Justin Brecheisen
747	James Mathison
748	Chase Graff
749	Tyler Stordahl
750	Jeremy Storvick
751	Derek Deblieck
752	Chris Covert
753	Andrew Etteldorf
754	Sam Richmond
755	Alex Schneider
756	Gabe Coleman
757	Robert Nelson
758	Nick Dea
759	Kyle Becker
760	Luke Lillehaugen
761	Dylan Lasron-Harsch
762	Jess Palyan
763	John Miles
764	Joey Gais
765	Ben Bartensetin
766	Kyle Fredrickson
767	Sam Karlson
768	Ethan Ellis
769	Benjamin Erickson
770	Alec Dewitz
771	Alex Ozark
772	Jack Schugel
773	Ryan Moore
774	Kai Heen
775	Brandon Johnson
776	Pallav Kumar
777	Bailey Lachance
778	Max Bauer
779	Connor Sandok
780	Frank Spence
781	Matt Steele
782	Will Feeney
783	Peter Fry
784	Mason Martinez
785	Landry Hacklander
786	Austin Kleman
787	Yasir Said
788	Luke Owens
789	Thomas  Knobbe
790	Evan  Jones
791	Tremayne Collins
792	Cameron Meikle
793	Carston  Dammann
794	Jack Henschel
795	Sam Bell
796	Fernando  Benitez
797	John Mark Shields
798	James Doherty
799	Spencer Urick
800	Eric Wicklund
801	Scott Helstad
802	Sam  Friesen
803	Christopher Brenk
804	Henry Harper
805	Elliot Kadrofske
806	Andy Barnhart
807	Collin Kiley
808	Keenan Ronayne
809	Keaton Shinn
810	Robert  Nelson
811	Kyle  Fredrickson
812	Jake Lepak
813	Ernesto Polania-Gonzalez
814	Karl Wachter
815	Samuel Cruz
816	Josh Larson
817	Bailey LaChance
818	Bridger  Pavelka
819	George McGivern
820	Dylan Larson-Harsch
821	Jackson Simon
822	Ethan Engberg
823	Mathew  Paal
824	Brian Bettes
825	Justin  Brecheisen
826	Conrad Phelan
827	Edward Hershewe
828	Owen Wright
829	Peter Jarka-Sellers
830	Tyler  Stordahl
831	Nathaniel Sauerberg
832	Jacob Bransky
833	Seguy Hanson
834	Andrew Wischnack
835	Isaac Slagel
836	Sean Lonergan
837	Ben Borash
838	Alex Theship-Rosales
839	Nick Solheim
840	Andrew Elliott
841	Gnanaharish Jayachandraba
842	Jacob Van Houtan
843	Caleb Foster
844	Sam O'Donnell-Hoff
845	Thomas Nelson
846	Spencer Ware Joncas
847	Robert  Lawrence
848	Ben Bildsten
849	Geleto Roba
850	Dan Ziebarth
851	Alec Getzloff
852	Olsen Pancoast
853	Sam  Longenbach
854	Peter Aehl
855	Samuel Abegglen
856	Cole Nelson
857	Elijah Fourre
858	Kevin  Dudley
859	Yasir  Said
860	Tommy Froland
861	Kellen Overvig
862	Jackson Gerber
863	Teagan Brogdon
864	Hunter  Kraling
865	Marlon Barrett-Dwyer
866	Jason Marshall
867	Sean  Adams
868	David Braun
869	Lucas Mueller
870	Andrew Stumbo
871	Matthew Wilkinson
872	Frank Gustafson
873	Fernando Benitez
874	Tyler Bethke
875	Josh Halverson
876	Carl Kozlowski
877	Sam Primozich
878	Liban Jama
879	Brennan Gustafson
880	Ezekiel Lelinga
881	Ben Madigan
882	Munir Isahak
883	Anders Rasmussen
884	Justin Brakob
885	Jack Colleran
886	Adrian Johnson
887	Nick Kerbeshian
888	Noah Webb
889	Erik Kivela
890	Nicholas Rethemeier
891	Noah Kneeskern
892	Bridger Pavelka
893	Erik Larson
894	Jonathan Sweeney
895	Edwin Reyes Herrera
896	Jonah Herzog
897	Jordan Malikowski
898	Jonathon Meaden
899	Ben Schnieders
900	Zach Herman
901	Seth Jackson
902	Carter Woetzel
903	Sam Stresemann
904	Chris Schold
905	Kristofer Johnson
906	Connor Haugrud
907	Isaac Tade
908	Max Kuhs
909	Matthew Paal
910	Tommy McHugh
911	Austin Schroepfer
912	Michael Milner
913	Ben Roen
914	Anders Olson
915	Isaiah Olsem
916	Lukas Lindgren
917	Tanner Moris
918	Alden Aaberg
919	Evan David
920	Nathan Scruggs
921	Josh Willard
922	Michael Finn
923	Collin Hartogh
924	William McLeer
925	Clay Tydings
926	Sam O'Donnell-hoff
927	Greg Miller
928	Christopher Stanek
929	Zac Lane
930	Aidan Tollefson
931	Anthony Smith
932	Sam Bergman
933	Zach Eicher
934	Sasha Lewis-Norelle
935	James Berg
936	Gabe Segura
937	Mark Baumeister
938	Jacob Czech
939	Nathan Drees
940	Brendon Nuese
941	Casey Olson
942	Matt Lorah
943	Baylor Leese
944	Hans Frank-Holzner
945	Elijah Levey
946	Evan Green
947	Alex Walsh
948	Alan Scheuermann
949	Armando Hernandez
950	David Stone
951	Theodore Sweet
952	Macallister Karrick
953	Adam Nakasaka
954	Biel Wiel
955	Eliott Cassidy
956	Gemechu Meskele
957	Ben Santos
958	Ike Mendel
959	Adam Ebent
960	Ben Wicklund
961	Mohamed Salad
962	Nolan Christenson
963	Jack Degonda
964	Garet Grant
965	Noah Johnson
966	Andy Goldsmith
967	Landon Javens
968	Stephen Lavey
969	Reuben Kosche
970	Jack Heun
971	Ryan Houseman
972	Fred Kerr
973	Keegan Sansone
974	Dillon Diekmann
975	Nicholas Sluga
976	Smith Mayse
977	Lars Ripley
978	Matt Payne
979	Nick Olfert
980	Lucas Schnirring
981	Joe Huffman
982	Tyler Gallagher
983	Parker Zak
984	Jared Wiens
985	Jack Osborne
986	Henry Shore
987	Justus Fast
988	Ryan Davis
989	Michael Kraimer
990	Nathan Meyer
991	Zane Michael
992	Jeremy Gilbertson
993	Jesse Shufro-Zletz
994	Aric Brodie
995	Bridger Rives
996	Oscar Christoph
997	Luke Pedersen
998	Camerson Schultz
999	Kojo Herzog
1000	Maxwell Krause
1001	Isaiah Hobus
1002	Elijah Levy
1003	Bryce Knutson
1004	Brian Carl
1005	Brett Hunsanger
1006	Henrik Gilbertson
1007	Kevin Sethre
1008	Max Mayer
1009	Marc Donnelly
1010	Timothy Zehr
1011	Joseph Bastian
1012	Luke Malek
1013	Eric Trempe
1014	Tyler Northey
1015	Josh Wilson
1016	Justin Kringler
1017	Jens Lange
1018	Peter Larson
1019	Cian Hanrahan
1020	Christian Barlow
1021	Yuto Watanabe
1022	Thomas Razildo
1023	Jack McCabe
1024	Charlie Otto
1025	Thomas Dea
1026	George Mcgivern
1027	Zach Haire
1028	Arne Ellefson-Carnes
1029	Zak Sather
1030	Thomas Nemanich
1031	Derk Lyford
1032	Henry Bowman
1033	Penn Sagedahl
1034	Ben Chao
1035	Colton Halla
1036	Adam Mccollor
1037	Sakariya Hussien
1038	Kenyon Nystrom
1039	Sam Theisen
1040	Mitchell Grand
1041	Ben Perry
1042	Nehemiah Gaim
1043	Jesse Middendorf
1044	Tanner Olson
1045	Henry Hinchcliffe
1046	Kevin Montresor
1047	Elijah Jones
1048	Solomon Johnson
1049	Noah Massanari
1050	Basil Ricker
1051	Aidan St George
1052	Morey Smith
1053	Treycen Eckman
1054	Jeremy Fong
1055	Tommy Ryan
1056	Ben Aoki-Sherwood
1057	Riley Berg
1058	Anders Narum
1059	Samuel Rengo
1060	Alexei Hensel
1061	Michael Abeyta
1062	Julian Munoz
1063	Mike Ward
1064	Trevor Lavigne
1065	Alexander Stonick
1066	Tucker Wallin
1067	Michael Kraimer 
1068	Jonathan Meaden
1069	Luke Peterson
1070	John Cramer
1071	Noah Smith
1072	Jared Brandt
1073	Erik Sworski
1074	Nathan Clausing
1075	Parker Johnson
1076	Caedon Mccartney
1077	Chris Raabe-Pavlov
1078	Dawson Ashley
1079	Avery Watts
1080	Cole Peske
1081	Jack Marble
1082	Axel Daood
1083	Zachary Foquerel-Skoe
1084	Ethan Unruh
1085	Corbin Michels
1086	Matt Gilles
1087	Peter Rachlin
1088	Jacob Lipke
1089	Daniel Kloeppner
1090	Jose Pantoja
1091	Ethan Smith
1092	Jack Gothberg
1093	Tad Stewart
1094	Thomas Liking
1095	Jack Mccabe
1096	Erik Garcia Gonzaga
1097	Taylor Devine
1098	JoJo Baldus
1099	Aaron Puent
1100	Juan Burleigh
1101	Sam Marble
1102	Simon Zahrbock
1103	Cameron Regan
1104	Keaton Martin
1105	William Mcleer
\.


--
-- Data for Name: individual_performances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.individual_performances (id, ath_id, meet_id, team_id, place, "time") FROM stdin;
1	1	1	7	1	1521.1
2	2	1	5	2	1555.1
3	3	1	2	3	1555.7
4	4	1	3	4	1556.1
5	5	1	9	5	1561.4
6	6	1	5	6	1571.5
7	7	1	2	7	1572.1
8	8	1	3	8	1575
9	9	1	10	9	1576.8
10	10	1	6	10	1585.7
11	11	1	10	11	1586.9
12	12	1	3	12	1593.3
13	13	1	2	13	1596.9
14	14	1	6	14	1599.6
15	15	1	5	15	1608.4
16	16	1	2	16	1610.7
17	17	1	10	17	1612.5
18	18	1	5	18	1613.8
19	19	1	3	19	1614.2
20	20	1	5	20	1614.8
21	21	1	6	21	1621
22	22	1	1	22	1621
23	23	1	3	23	1622.4
24	24	1	1	24	1623
25	25	1	6	25	1623
26	26	1	3	26	1626.4
27	27	1	10	27	1626.6
28	28	1	5	28	1632.3
29	29	1	9	29	1634.3
30	30	1	5	30	1639.2
31	31	1	6	31	1639.5
32	32	1	4	32	1640.1
33	33	1	5	33	1642.1
34	34	1	10	34	1642.4
35	35	1	1	35	1649.8
36	36	1	4	36	1649.9
37	37	1	7	37	1650.7
38	38	1	4	38	1650.7
39	39	1	7	39	1652.2
40	40	1	5	40	1652.8
41	41	1	11	41	1653.6
42	42	1	1	42	1654.5
43	43	1	11	43	1656.6
44	44	1	3	44	1657.6
45	45	1	2	45	1661.6
46	46	1	5	46	1663.3
47	47	1	10	47	1664.3
48	48	1	6	48	1665.4
49	49	1	7	49	1668.8
50	50	1	1	50	1670.8
51	51	1	4	51	1672.3
52	52	1	6	52	1673.8
53	53	1	3	53	1676.5
54	54	1	6	54	1676.6
55	55	1	9	55	1677.5
56	56	1	6	56	1677.8
57	57	1	1	57	1679.5
58	58	1	2	58	1680
59	59	1	2	59	1680
60	60	1	1	60	1681.3
61	61	1	3	61	1684.4
62	62	1	6	62	1686.1
63	63	1	2	63	1687.5
64	64	1	4	64	1687.9
65	65	1	7	65	1690.3
66	66	1	5	66	1690.6
67	67	1	4	67	1691.1
68	68	1	2	68	1691.7
69	69	1	3	69	1692.6
70	70	1	7	70	1692.7
71	71	1	7	71	1692.8
72	72	1	5	72	1694.4
73	73	1	6	73	1695.9
74	74	1	2	74	1696.1
75	75	1	7	75	1697.5
76	76	1	4	76	1698.4
77	77	1	3	77	1699
78	78	1	6	78	1701.4
79	79	1	9	79	1702.2
80	80	1	2	80	1705.4
81	81	1	3	81	1706
82	82	1	4	82	1709.7
83	83	1	3	83	1710.7
84	84	1	11	84	1712.4
85	85	1	9	85	1713
86	86	1	8	86	1714.6
87	87	1	8	87	1714.8
88	88	1	2	88	1717.8
89	89	1	3	89	1719.6
90	90	1	10	90	1720.8
91	91	1	6	91	1726
92	92	1	1	92	1727.9
93	93	1	11	93	1729
94	94	1	3	94	1729.2
95	95	1	3	95	1730.1
96	96	1	11	96	1732
97	97	1	5	97	1733.2
98	98	1	11	98	1736.7
99	99	1	3	99	1738.4
100	100	1	7	100	1739.6
101	101	1	6	101	1743.5
102	102	1	4	102	1744.1
103	103	1	10	103	1744.5
104	104	1	11	104	1744.8
105	105	1	9	105	1750.7
106	106	1	8	106	1750.9
107	107	1	7	107	1752.2
108	108	1	8	108	1752.3
109	109	1	3	109	1752.4
110	110	1	1	110	1753.2
111	111	1	10	111	1755.4
112	112	1	2	112	1757.2
113	113	1	8	113	1758.5
114	114	1	1	114	1760.4
115	115	1	11	115	1762
116	116	1	6	116	1763.1
117	117	1	8	117	1764.4
118	118	1	9	118	1765.2
119	119	1	6	119	1765.6
120	120	1	10	120	1765.7
121	121	1	1	121	1766.5
122	122	1	8	122	1766.5
123	123	1	7	123	1767.3
124	124	1	4	124	1769.6
125	125	1	6	125	1770.2
126	126	1	7	126	1770.5
127	127	1	10	127	1772.3
128	128	1	11	128	1772.6
129	129	1	1	129	1772.9
130	130	1	10	130	1773.4
131	131	1	8	131	1775.4
132	132	1	1	132	1776.5
133	133	1	1	133	1780.5
134	134	1	8	134	1782.3
135	135	1	7	135	1783.5
136	136	1	4	136	1783.8
137	137	1	5	137	1784
138	138	1	1	138	1785
139	139	1	2	139	1787.8
140	140	1	6	140	1790.4
141	141	1	3	141	1794
142	142	1	4	142	1794
143	143	1	8	143	1794.7
144	144	1	10	144	1802.4
145	145	1	3	145	1804.6
146	146	1	6	146	1805.3
147	147	1	8	147	1805.4
148	148	1	2	148	1806.8
149	149	1	3	149	1808
150	150	1	1	150	1809.5
151	151	1	6	151	1809.8
152	152	1	7	152	1811.2
153	153	1	2	153	1811.4
154	154	1	7	154	1813.7
155	155	1	3	155	1818.3
156	156	1	11	156	1819.2
157	157	1	3	157	1819.8
158	158	1	9	158	1820.6
159	159	1	6	159	1822.4
160	160	1	6	160	1824.9
161	161	1	6	161	1826.1
162	162	1	1	162	1827.6
163	163	1	6	163	1828.4
164	164	1	6	164	1829.3
165	165	1	4	165	1830.6
166	166	1	8	166	1832.2
167	167	1	6	167	1832.7
168	168	1	8	168	1834.5
169	169	1	8	169	1835.5
170	170	1	6	170	1835.6
171	171	1	6	171	1838.1
172	172	1	6	172	1840.5
173	173	1	6	173	1841.1
174	174	1	9	174	1843.2
175	175	1	10	175	1849.4
176	176	1	3	176	1855.7
177	177	1	8	177	1864.6
178	178	1	9	178	1865.3
179	179	1	1	179	1869.5
180	180	1	2	180	1869.8
181	181	1	11	181	1872.9
182	182	1	9	182	1874.8
183	183	1	6	183	1877.5
184	184	1	3	184	1882
185	185	1	4	185	1894.4
186	186	1	6	186	1897.5
187	187	1	1	187	1903.9
188	188	1	7	188	1915.5
189	189	1	6	189	1916.7
190	190	1	10	190	1922.2
191	191	1	4	191	1927.6
192	192	1	4	192	1934.4
193	193	1	7	193	1941.6
194	194	1	1	194	1954.4
195	195	1	8	195	1968.6
196	196	1	7	196	1981
197	197	1	8	197	2007.5
198	198	1	4	198	2013.2
199	199	1	3	199	2027.4
200	200	1	6	200	2038.6
201	201	1	8	201	2044.1
202	202	1	8	202	2071.2
203	203	1	9	203	2088.4
204	204	1	8	204	2269.1
205	6	2	5	1	1538.7
206	205	2	8	2	1549.3
207	10	2	6	3	1550.4
208	66	2	5	4	1573.2
209	30	2	5	5	1574.4
210	28	2	5	6	1576.7
211	3	2	2	7	1580.9
212	37	2	7	8	1582.6
213	26	2	3	9	1588.3
214	65	2	7	10	1590.1
215	25	2	6	11	1594.6
216	19	2	3	12	1596
217	16	2	2	13	1597.2
218	41	2	11	14	1597.8
219	18	2	5	15	1600.1
220	23	2	3	16	1605.4
221	61	2	3	17	1607.1
222	20	2	5	18	1607.5
223	27	2	10	19	1610.6
224	206	2	4	20	1612
225	207	2	6	21	1614
226	35	2	1	22	1618.6
227	40	2	5	23	1618.9
228	113	2	8	24	1619.6
229	95	2	3	25	1621.2
230	208	2	1	26	1624.2
231	83	2	3	27	1624.9
232	39	2	7	28	1625.1
233	94	2	3	29	1625.2
234	172	2	6	30	1626
235	48	2	6	31	1626
236	82	2	4	32	1627.8
237	209	2	3	33	1628.3
238	210	2	9	34	1632.2
239	211	2	3	35	1634.5
240	212	2	3	36	1634.8
241	213	2	1	37	1635.2
242	21	2	6	38	1637.1
243	43	2	11	39	1637.7
244	99	2	3	40	1638.4
245	59	2	2	41	1640.4
246	105	2	9	42	1643.6
247	214	2	3	43	1644.6
248	12	2	3	44	1646.6
249	45	2	2	45	1646.7
250	78	2	6	46	1647.1
251	215	2	3	47	1649.1
252	47	2	10	48	1651.9
253	132	2	1	49	1652.4
254	50	2	1	50	1653.7
255	216	2	10	51	1653.8
256	101	2	6	52	1656.2
257	217	2	6	53	1657.4
258	218	2	2	54	1659.5
259	62	2	6	55	1660.7
260	219	2	8	56	1662.5
261	68	2	2	57	1663.8
262	42	2	1	58	1669.5
263	54	2	6	59	1671.5
264	220	2	6	60	1672
265	89	2	3	61	1674.4
266	221	2	3	62	1675.1
267	46	2	5	63	1675.6
268	222	2	7	64	1677.5
269	223	2	3	65	1678.7
270	70	2	7	66	1679.7
271	64	2	4	67	1681.4
272	97	2	5	68	1681.9
273	224	2	2	69	1683.4
274	225	2	2	70	1683.4
275	67	2	4	71	1684.7
276	100	2	7	72	1685.5
277	29	2	9	73	1685.9
278	226	2	11	74	1687
279	227	2	2	75	1687.7
280	228	2	4	76	1687.7
281	96	2	11	77	1688.6
282	86	2	8	78	1692.1
283	229	2	3	79	1693
284	133	2	1	80	1694.5
285	127	2	10	81	1697.9
286	230	2	9	82	1698.5
287	155	2	3	83	1700.7
288	160	2	6	84	1701.1
289	149	2	3	85	1702.4
290	231	2	4	86	1702.9
291	232	2	3	87	1704.1
292	112	2	2	88	1704.3
293	93	2	11	89	1705.5
294	102	2	4	90	1706
295	233	2	10	91	1706.7
296	81	2	3	92	1708.8
297	234	2	4	93	1709.2
298	235	2	6	94	1710.6
299	92	2	1	95	1710.6
300	236	2	5	96	1710.9
301	237	2	6	97	1712.1
302	238	2	8	98	1712.7
303	239	2	1	99	1712.8
304	128	2	11	100	1713.7
305	240	2	2	101	1717.6
306	144	2	10	102	1718.2
307	241	2	5	103	1718.7
308	242	2	1	104	1721.1
309	147	2	8	105	1724.6
310	116	2	6	106	1724.7
311	80	2	2	107	1725.3
312	243	2	3	108	1726.2
313	244	2	11	109	1726.6
314	72	2	5	110	1729.2
315	55	2	9	111	1730.9
316	109	2	3	112	1732.9
317	245	2	8	113	1733
318	246	2	6	114	1733.7
319	247	2	3	115	1735.3
320	151	2	6	116	1736.2
321	248	2	4	117	1736.4
322	115	2	11	118	1738.2
323	32	2	4	119	1739.8
324	249	2	3	120	1747.7
325	117	2	8	121	1748.3
326	157	2	3	122	1749.9
327	125	2	6	123	1750
328	90	2	10	124	1752.7
329	250	2	1	125	1753.8
330	251	2	3	126	1756.4
331	252	2	11	127	1757.7
332	154	2	7	128	1758.7
333	253	2	6	129	1758.8
334	254	2	3	130	1759.3
335	110	2	1	131	1760.7
336	255	2	3	132	1763.4
337	256	2	6	133	1763.4
338	126	2	7	134	1765.7
339	257	2	9	135	1766.2
340	258	2	8	136	1766.4
341	136	2	4	137	1766.9
342	259	2	9	138	1767
343	134	2	8	139	1767.2
344	260	2	6	140	1768.2
345	261	2	2	141	1769.7
346	150	2	1	142	1771.3
347	262	2	6	143	1771.9
348	170	2	6	144	1772.3
349	263	2	6	145	1774.4
350	131	2	8	146	1777.9
351	264	2	3	147	1780.9
352	193	2	7	148	1781.3
353	85	2	9	149	1781.5
354	265	2	8	150	1782.2
355	180	2	2	151	1784.2
356	266	2	1	152	1784.7
357	267	2	6	153	1784.8
358	268	2	6	154	1785.7
359	182	2	9	155	1786.4
360	106	2	8	156	1786.4
361	269	2	8	157	1789.7
362	139	2	2	158	1790.8
363	162	2	1	159	1791.4
364	168	2	8	160	1793.5
365	270	2	6	161	1794.4
366	271	2	6	162	1794.7
367	272	2	3	163	1795.9
368	181	2	11	164	1797.6
369	169	2	8	165	1797.9
370	273	2	9	166	1798.3
371	274	2	6	167	1798.5
372	179	2	1	168	1799.3
373	111	2	10	169	1800.2
374	275	2	6	170	1803.6
375	276	2	7	171	1805.6
376	277	2	3	172	1808.2
377	278	2	5	173	1808.8
378	279	2	2	174	1809
379	280	2	4	175	1812.4
380	281	2	7	176	1812.7
381	171	2	6	177	1812.9
382	282	2	6	178	1813.4
383	124	2	4	179	1813.8
384	138	2	1	180	1815.3
385	283	2	9	181	1816.3
386	284	2	1	182	1820.7
387	285	2	4	183	1822.6
388	175	2	10	184	1822.9
389	286	2	10	185	1827.4
390	287	2	9	186	1828.2
391	288	2	11	187	1831.3
392	188	2	7	188	1833.1
393	289	2	8	189	1834.8
394	290	2	9	190	1835.3
395	291	2	9	191	1837.8
396	187	2	1	192	1838.7
397	174	2	9	193	1840.7
398	156	2	11	194	1841.9
399	292	2	3	195	1842.6
400	140	2	6	196	1846.8
401	165	2	4	197	1851.4
402	293	2	8	198	1851.4
403	294	2	4	199	1856.5
404	295	2	8	200	1859.8
405	98	2	11	201	1868.9
406	296	2	8	202	1872.5
407	176	2	3	203	1875.1
408	297	2	1	204	1878.8
409	298	2	11	205	1880.1
410	299	2	4	206	1880.4
411	300	2	3	207	1896.8
412	301	2	1	208	1898.3
413	302	2	6	209	1898.7
414	303	2	10	210	1898.8
415	304	2	6	211	1901.6
416	305	2	8	212	1904.2
417	306	2	6	213	1907.1
418	307	2	6	214	1910.5
419	308	2	3	215	1914.3
420	309	2	7	216	1917.6
421	310	2	7	217	1925.6
422	311	2	9	218	1941.2
423	194	2	1	219	1947.4
424	312	2	9	220	1949.6
425	313	2	3	221	1950.8
426	314	2	3	222	1952.1
427	315	2	9	223	1968.4
428	190	2	10	224	1975.4
429	316	2	4	225	1985.4
430	317	2	8	226	1986.6
431	318	2	1	227	2011.2
432	198	2	4	228	2022.3
433	195	2	8	229	2030.4
434	319	2	8	230	2030.5
435	320	2	7	231	2050.5
436	321	2	8	232	2062.7
437	197	2	8	233	2064.9
438	183	2	6	234	2069.9
439	322	2	9	235	2088.6
440	323	2	6	236	2098.7
441	201	2	8	237	2254.8
442	324	2	3	238	2292.2
443	3	3	2	1	1494
444	6	3	5	2	1526
445	66	3	5	3	1527
446	18	3	5	4	1528
447	205	3	8	5	1530
448	325	3	3	6	1536
449	37	3	7	7	1545
450	211	3	3	8	1548
451	27	3	7	9	1553
452	61	3	3	10	1554
453	326	3	3	11	1560
454	208	3	1	12	1563
455	327	3	9	13	1564
456	216	3	10	14	1565
457	328	3	7	15	1566
458	30	3	5	16	1573
459	35	3	1	17	1580
460	25	3	6	18	1581
461	81	3	3	19	1581
462	97	3	5	20	1582
463	207	3	6	21	1583
464	41	3	11	22	1584
465	172	3	6	23	1586
466	217	3	6	24	1587
467	48	3	6	25	1587
468	329	3	4	26	1589
469	219	3	8	27	1593
470	330	3	11	28	1594
471	40	3	5	29	1595
472	331	3	3	30	1598
473	100	3	7	31	1600
474	16	3	2	32	1600
475	232	3	3	33	1602
476	71	3	2	34	1603
477	220	3	6	35	1604
478	332	3	6	36	1607
479	82	3	4	37	1608
480	89	3	3	38	1616
481	43	3	11	39	1616
482	80	3	2	40	1617
483	242	3	1	41	1620
484	215	3	3	42	1624
485	212	3	3	43	1625
486	206	3	4	44	1627
487	72	3	5	45	1630
488	127	3	10	46	1633
489	333	3	2	47	1634
490	239	3	1	48	1637
491	29	3	9	49	1639
492	226	3	11	50	1641
493	334	3	3	51	1642
494	78	3	6	52	1642
495	335	3	9	53	1642
496	110	3	1	54	1642
497	244	3	11	55	1643
498	59	3	2	56	1644
499	42	3	1	57	1646
500	278	3	5	58	1648
501	336	3	5	59	1649
502	209	3	3	60	1650
503	76	3	4	61	1651
504	228	3	4	62	1651
505	283	3	9	63	1652
506	337	3	7	64	1653
507	284	3	1	65	1654
508	237	3	6	66	1654
509	338	3	9	67	1655
510	339	3	3	68	1656
511	93	3	11	69	1658
512	340	3	4	70	1659
513	109	3	3	71	1660
514	133	3	1	72	1662
515	341	3	1	73	1664
516	342	3	8	74	1665
517	343	3	9	75	1669
518	241	3	5	76	1670
519	344	3	8	77	1671
520	345	3	3	78	1671
521	155	3	3	79	1672
522	346	3	3	80	1672
523	347	3	6	81	1672
524	348	3	3	82	1675
525	349	3	10	83	1677
526	139	3	2	84	1678
527	350	3	3	85	1679
528	70	3	7	86	1679
529	351	3	4	87	1680
530	352	3	3	88	1682
531	102	3	4	89	1683
532	353	3	2	90	1684
533	354	3	1	91	1685
534	227	3	2	92	1686
535	355	3	6	93	1686
536	249	3	3	94	1687
537	356	3	2	95	1688
538	126	3	7	96	1688
539	357	3	4	97	1689
540	45	3	2	98	1690
541	358	3	3	99	1691
542	359	3	10	100	1691
543	360	3	6	101	1691
544	361	3	5	102	1693
545	225	3	2	103	1693
546	362	3	3	104	1695
547	261	3	2	105	1695
548	363	3	7	106	1698
549	233	3	10	107	1699
550	136	3	4	108	1700
551	250	3	1	109	1700
552	364	3	3	110	1704
553	268	3	6	111	1705
554	365	3	2	112	1706
555	366	3	3	113	1707
556	137	3	5	114	1708
557	367	3	2	115	1710
558	247	3	3	116	1711
559	131	3	8	117	1712
560	368	3	6	118	1715
561	277	3	3	119	1715
562	369	3	5	120	1715
563	370	3	1	121	1716
564	371	3	11	122	1717
565	372	3	8	123	1719
566	373	3	9	124	1721
567	149	3	3	125	1721
568	374	3	9	126	1722
569	262	3	6	127	1722
570	375	3	6	128	1723
571	376	3	6	129	1723
572	181	3	11	130	1723
573	377	3	7	131	1725
574	267	3	6	132	1727
575	378	3	5	133	1728
576	379	3	3	134	1729
577	380	3	6	135	1731
578	285	3	4	136	1736
579	292	3	3	137	1739
580	134	3	8	138	1739
581	381	3	1	139	1741
582	168	3	8	140	1742
583	154	3	7	141	1742
584	275	3	6	142	1742
585	382	3	6	143	1744
586	264	3	3	144	1745
587	293	3	8	145	1747
588	248	3	4	146	1750
589	144	3	10	147	1752
590	383	3	7	148	1752
591	273	3	9	149	1753
592	270	3	6	150	1753
593	179	3	1	151	1756
594	384	3	4	152	1758
595	385	3	6	153	1761
596	386	3	4	154	1763
597	178	3	9	155	1769
598	387	3	3	156	1771
599	257	3	9	157	1773
600	124	3	4	158	1774
601	180	3	2	159	1777
602	182	3	9	160	1778
603	289	3	8	161	1780
604	301	3	1	162	1780
605	388	3	8	163	1783
606	389	3	3	164	1786
607	271	3	6	165	1786
608	252	3	11	166	1790
609	390	3	3	167	1790
610	111	3	10	168	1793
611	297	3	1	169	1793
612	391	3	3	170	1795
613	174	3	9	171	1796
614	392	3	11	172	1796
615	393	3	3	173	1798
616	394	3	7	174	1799
617	176	3	3	175	1800
618	311	3	9	176	1808
619	395	3	8	177	1808
620	321	3	8	178	1809
621	188	3	7	179	1813
622	396	3	3	180	1817
623	318	3	1	181	1818
624	287	3	9	182	1819
625	397	3	1	183	1820
626	398	3	1	184	1821
627	399	3	7	185	1822
628	400	3	1	186	1827
629	401	3	8	187	1834
630	402	3	8	188	1840
631	403	3	5	189	1845
632	404	3	3	190	1850
633	405	3	8	191	1853
634	98	3	11	192	1854
635	299	3	4	193	1857
636	406	3	4	194	1858
637	407	3	9	195	1859
638	274	3	6	196	1860
639	304	3	6	197	1864
640	282	3	6	198	1870
641	408	3	6	199	1872
642	409	3	6	200	1872
643	410	3	4	201	1885
644	305	3	8	202	1889
645	411	3	9	203	1901
646	412	3	11	204	1911
647	413	3	3	205	1913
648	317	3	8	206	1917
649	288	3	11	207	1917
650	414	3	3	208	1919
651	295	3	8	209	1922
652	223	3	3	210	1928
653	415	3	8	211	1944
654	416	3	4	212	1956
655	417	3	4	213	1983
656	418	3	6	214	1993
657	419	3	5	215	1996
658	198	3	4	216	2004
659	420	3	7	217	2034
660	323	3	6	218	2047
661	421	3	8	219	2070
662	195	3	8	220	2105
663	422	3	8	221	2152
664	423	3	4	222	2179
665	424	3	3	223	2361
666	325	4	3	1	1508.1
667	216	4	10	2	1529.6
668	328	4	7	3	1532.8
669	37	4	7	4	1537.7
670	97	4	5	5	1538.5
671	40	4	5	6	1540.1
672	425	4	2	7	1549.1
673	211	4	3	8	1550.9
674	207	4	6	9	1551.9
675	217	4	6	10	1558.8
676	227	4	2	11	1562.2
677	426	4	3	12	1562.9
678	330	4	11	13	1563.8
679	61	4	3	14	1570.4
680	208	4	1	15	1571.5
681	35	4	1	16	1572.4
682	244	4	11	17	1578.2
683	43	4	11	18	1581
684	427	4	3	19	1581.8
685	225	4	2	20	1582.4
686	213	4	1	21	1583.4
687	27	4	7	22	1584.2
688	113	4	8	23	1584.8
689	428	4	6	24	1585.1
690	19	4	3	25	1588.5
691	429	4	5	26	1590.9
692	353	4	2	27	1596.4
693	219	4	8	28	1596.6
694	270	4	6	29	1598.7
695	251	4	3	30	1599.2
696	232	4	3	31	1599.9
697	220	4	6	32	1600.6
698	333	4	2	33	1605.6
699	100	4	7	34	1606.7
700	430	4	6	35	1608.4
701	343	4	9	36	1610.1
702	226	4	11	37	1612.4
703	431	4	3	38	1614.5
704	81	4	3	39	1617.2
705	327	4	9	40	1617.5
706	212	4	3	41	1617.6
707	432	4	3	42	1617.8
708	376	4	6	43	1617.9
709	345	4	3	44	1620
710	433	4	7	45	1621.5
711	434	4	2	46	1622.1
712	329	4	4	47	1622.6
713	132	4	1	48	1625.3
714	435	4	10	49	1626.5
715	45	4	2	50	1626.9
716	436	4	1	51	1627.7
717	336	4	5	52	1630.3
718	102	4	4	53	1631.4
719	224	4	2	54	1634.1
720	354	4	1	55	1634.5
721	411	4	9	56	1637.4
722	437	4	3	57	1638.9
723	438	4	6	58	1638.9
724	72	4	5	59	1639.2
725	340	4	4	60	1640.2
726	261	4	2	61	1640.3
727	342	4	8	62	1640.8
728	439	4	2	63	1641.1
729	383	4	7	64	1641.3
730	239	4	1	65	1642.4
731	42	4	1	66	1642.9
732	440	4	5	67	1643.8
733	248	4	4	68	1643.9
734	441	4	2	69	1644.6
735	231	4	4	70	1644.7
736	294	4	4	71	1644.7
737	126	4	7	72	1645
738	442	4	9	73	1645.6
739	83	4	3	74	1647.8
740	443	4	3	75	1650.3
741	338	4	9	76	1650.6
742	89	4	3	77	1650.7
743	348	4	3	78	1652.1
744	444	4	11	79	1655.8
745	445	4	2	80	1656.4
746	446	4	3	81	1657.3
747	266	4	1	82	1658
748	384	4	4	83	1659.6
749	360	4	6	84	1660
750	447	4	6	85	1660.9
751	257	4	9	86	1660.9
752	448	4	6	87	1661.4
753	369	4	5	88	1661.4
754	449	4	6	89	1662
755	450	4	6	90	1662.2
756	451	4	11	91	1663.5
757	452	4	2	92	1666.3
758	453	4	3	93	1666.7
759	362	4	3	94	1667.8
760	454	4	6	95	1668
761	133	4	1	96	1668.3
762	262	4	6	97	1671.8
763	455	4	5	98	1672.1
764	242	4	1	99	1675.2
765	396	4	3	100	1677.4
766	109	4	3	101	1678.9
767	181	4	11	102	1680.8
768	331	4	3	103	1684.1
769	390	4	3	104	1686
770	456	4	2	105	1687.2
771	157	4	3	106	1687.7
772	160	4	6	107	1688.3
773	386	4	4	108	1689.1
774	457	4	1	109	1690
775	352	4	3	110	1690.3
776	458	4	7	111	1691
777	274	4	6	112	1693.3
778	459	4	10	113	1694.6
779	341	4	1	114	1696.7
780	156	4	11	115	1697.2
781	155	4	3	116	1697.8
782	193	4	7	117	1698.8
783	280	4	4	118	1700.6
784	188	4	7	119	1701.8
785	349	4	10	120	1702.3
786	460	4	3	121	1702.5
787	359	4	10	122	1702.7
788	461	4	9	123	1704
789	149	4	3	124	1704.2
790	228	4	4	125	1704.9
791	462	4	4	126	1705.3
792	243	4	3	127	1705.7
793	255	4	3	128	1707.4
794	129	4	1	129	1707.8
795	178	4	9	130	1708.9
796	463	4	6	131	1712.5
797	464	4	6	132	1712.8
798	275	4	6	133	1713.8
799	415	4	8	134	1714.4
800	409	4	6	135	1715.2
801	465	4	1	136	1715.6
802	377	4	7	137	1716.1
803	466	4	3	138	1717.1
804	467	4	2	139	1719
805	367	4	2	140	1719.6
806	468	4	6	141	1721.5
807	469	4	1	142	1721.9
808	265	4	8	143	1723.7
809	182	4	9	144	1723.8
810	380	4	6	145	1724.9
811	470	4	6	146	1725.4
812	471	4	11	147	1725.6
813	382	4	6	148	1728.6
814	92	4	1	149	1728.9
815	365	4	2	150	1729.4
816	472	4	9	151	1729.5
817	276	4	7	152	1730.2
818	473	4	3	153	1730.3
819	287	4	9	154	1733.5
820	278	4	5	155	1734.7
821	474	4	4	156	1735
822	475	4	2	157	1735.4
823	392	4	11	158	1735.4
824	254	4	3	159	1736.5
825	476	4	2	160	1736.7
826	361	4	5	161	1737.4
827	375	4	6	162	1739.8
828	477	4	2	163	1740.2
829	128	4	11	164	1742.8
830	478	4	7	165	1744.4
831	139	4	2	166	1745.2
832	370	4	1	167	1746.6
833	479	4	3	168	1749.7
834	480	4	10	169	1749.9
835	374	4	9	170	1750
836	273	4	9	171	1755.4
837	481	4	6	172	1757.7
838	400	4	1	173	1758.3
839	482	4	1	174	1759.3
840	176	4	3	175	1759.8
841	397	4	1	176	1761.6
842	483	4	4	177	1762
843	484	4	3	178	1762.8
844	485	4	5	179	1767.2
845	486	4	3	180	1768.5
846	388	4	8	181	1768.5
847	487	4	8	182	1769.5
848	358	4	3	183	1770.4
849	241	4	5	184	1770.8
850	488	4	4	185	1771.1
851	264	4	3	186	1771.9
852	489	4	6	187	1772.4
853	490	4	3	188	1777.2
854	491	4	9	189	1780.6
855	492	4	5	190	1781.1
856	408	4	6	191	1781.2
857	493	4	6	192	1786.2
858	399	4	7	193	1786.8
859	494	4	3	194	1788.8
860	404	4	3	195	1789.1
861	495	4	6	196	1790.2
862	398	4	1	197	1790.4
863	496	4	1	198	1791.4
864	174	4	9	199	1794.2
865	308	4	3	200	1794.3
866	292	4	3	201	1794.4
867	497	4	3	202	1795
868	318	4	1	203	1795.2
869	498	4	4	204	1795.9
870	413	4	3	205	1802.4
871	296	4	8	206	1804.8
872	499	4	11	207	1809.1
873	500	4	4	208	1809.8
874	501	4	3	209	1811.7
875	299	4	4	210	1812.6
876	381	4	1	211	1817.9
877	502	4	3	212	1819.6
878	503	4	6	213	1829.5
879	504	4	6	214	1840
880	277	4	3	215	1844.3
881	505	4	4	216	1854.4
882	506	4	10	217	1864.5
883	147	4	8	218	1866.9
884	314	4	3	219	1868
885	405	4	8	220	1876.9
886	507	4	9	221	1887.3
887	508	4	8	222	1915.8
888	509	4	7	223	1917.4
889	298	4	11	224	1923.9
890	510	4	7	225	1924.3
891	511	4	2	226	1935.2
892	512	4	7	227	1958.6
893	417	4	4	228	1960
894	407	4	9	229	1972.1
895	513	4	9	230	1978.9
896	514	4	6	231	2055.9
897	323	4	6	232	2061.9
898	198	4	4	233	2085.2
899	424	4	3	234	2123.3
900	515	4	7	235	2492.4
901	325	5	3	1	1506.2
902	516	5	3	2	1494.4
903	211	5	3	3	1511.8
904	328	5	7	4	1526.6
905	208	5	1	5	1540.7
906	426	5	3	6	1541.5
907	517	5	1	7	1542.6
908	432	5	3	8	1545.5
909	217	5	6	9	1548.9
910	232	5	3	10	1553.5
911	294	5	4	11	1558.1
912	518	5	10	12	1558.8
913	330	5	11	13	1559.7
914	30	5	5	14	1560.5
915	207	5	6	15	1561.7
916	431	5	3	16	1562
917	425	5	2	17	1562.4
918	242	5	1	18	1572
919	519	5	2	19	1574.8
920	342	5	8	20	1579.6
921	251	5	3	21	1583.2
922	333	5	2	22	1587
923	430	5	6	23	1587.1
924	475	5	2	24	1590.3
925	353	5	2	25	1592.6
926	213	5	1	26	1593.2
927	457	5	1	27	1596.8
928	270	5	6	28	1597.8
929	436	5	1	29	1598.6
930	210	5	9	30	1600.2
931	336	5	5	31	1600.7
932	327	5	9	32	1601.4
933	227	5	2	33	1603.6
934	224	5	2	34	1609.9
935	212	5	3	35	1611.3
936	520	5	8	36	1615.4
937	428	5	6	37	1622.1
938	257	5	9	38	1622.4
939	521	5	2	39	1625.3
940	522	5	1	40	1629.6
941	341	5	1	41	1630.3
942	479	5	3	42	1632.2
943	354	5	1	43	1633.2
944	523	5	11	44	1633.6
945	71	5	2	45	1633.8
946	448	5	6	46	1634.8
947	524	5	4	47	1635.6
948	396	5	3	48	1636.1
949	369	5	5	49	1637.1
950	243	5	3	50	1637.3
951	525	5	6	51	1639
952	442	5	9	52	1640.1
953	434	5	2	53	1640.3
954	360	5	6	54	1640.3
955	526	5	2	55	1643.8
956	225	5	2	56	1645.1
957	274	5	6	57	1646.9
958	429	5	5	58	1649.5
959	527	5	9	59	1650.3
960	440	5	5	60	1651.5
961	528	5	1	61	1654
962	338	5	9	62	1654.5
963	529	5	3	63	1654.7
964	467	5	2	64	1656.8
965	458	5	7	65	1658.9
966	443	5	3	66	1660.1
967	449	5	6	67	1661.1
968	530	5	9	68	1661.1
969	280	5	4	69	1661.5
970	456	5	2	70	1664
971	365	5	2	71	1664.6
972	531	5	9	72	1666.6
973	532	5	6	73	1667
974	533	5	8	74	1670.5
975	351	5	4	75	1670.6
976	466	5	3	76	1671.4
977	447	5	6	77	1673.7
978	160	5	6	78	1675.8
979	220	5	6	79	1676.7
980	362	5	3	80	1678.1
981	534	5	1	81	1679
982	535	5	7	82	1680.1
983	411	5	9	83	1680.9
984	352	5	3	84	1683.6
985	482	5	1	85	1686.7
986	536	5	2	86	1687.5
987	537	5	4	87	1688.5
988	538	5	4	88	1688.5
989	255	5	3	89	1688.8
990	539	5	6	90	1689.3
991	540	5	4	91	1689.8
992	505	5	4	92	1690.2
993	541	5	6	93	1691
994	542	5	11	94	1691.1
995	543	5	5	95	1694.3
996	544	5	2	96	1695
997	345	5	3	97	1695.1
998	386	5	4	98	1695.6
999	415	5	8	99	1696.5
1000	470	5	6	100	1697.3
1001	545	5	2	101	1699
1002	300	5	3	102	1699.8
1003	546	5	3	103	1700.4
1004	226	5	11	104	1704.9
1005	547	5	10	105	1705.5
1006	548	5	8	106	1706
1007	549	5	5	107	1712.9
1008	468	5	6	108	1713.3
1009	550	5	8	109	1713.7
1010	459	5	10	110	1715.3
1011	551	5	1	111	1715.8
1012	250	5	1	112	1716.3
1013	262	5	6	113	1717.6
1014	445	5	2	114	1720.1
1015	552	5	8	115	1720.5
1016	553	5	2	116	1720.9
1017	496	5	1	118	1722.2
1018	554	5	3	119	1723.2
1019	555	5	4	120	1723.7
1020	556	5	6	121	1724.3
1021	359	5	10	122	1724.5
1022	557	5	2	123	1724.7
1023	450	5	6	124	1725
1024	558	5	8	125	1725.2
1025	559	5	5	126	1725.7
1026	453	5	3	127	1726.5
1027	193	5	7	128	1727.9
1028	560	5	10	129	1728.1
1029	561	5	4	130	1728.6
1030	464	5	6	131	1728.7
1031	409	5	6	132	1729.7
1032	502	5	3	133	1730.1
1033	562	5	2	134	1730.9
1034	469	5	1	135	1731.1
1035	446	5	3	136	1732.2
1036	563	5	6	137	1732.4
1037	564	5	2	138	1733.9
1038	565	5	3	139	1736.4
1039	566	5	7	140	1737.5
1040	340	5	4	141	1737.8
1041	473	5	3	142	1739
1042	567	5	8	143	1740.6
1043	568	5	6	144	1742
1044	462	5	4	145	1742.7
1045	273	5	9	146	1742.8
1046	569	5	11	147	1743.2
1047	408	5	6	148	1743.6
1048	491	5	9	149	1744.3
1049	570	5	10	150	1745.2
1050	480	5	10	151	1745.9
1051	571	5	6	152	1746
1052	481	5	6	153	1746.2
1053	572	5	3	154	1746.2
1054	248	5	4	155	1748.1
1055	472	5	9	156	1748.7
1056	504	5	6	157	1748.8
1057	287	5	9	158	1751.2
1058	573	5	2	159	1751.2
1059	492	5	5	160	1752
1060	397	5	1	161	1752.4
1061	574	5	11	162	1754.7
1062	575	5	1	163	1755.4
1063	400	5	1	164	1755.6
1064	381	5	1	165	1755.9
1065	264	5	3	166	1758.2
1066	382	5	6	167	1760.3
1067	576	5	9	168	1762.5
1068	577	5	2	169	1764.6
1069	578	5	6	170	1765.5
1070	579	5	11	171	1766.5
1071	495	5	6	172	1769.2
1072	221	5	3	173	1770.6
1073	489	5	6	174	1773.9
1074	271	5	6	175	1779.3
1075	580	5	6	176	1779.9
1076	487	5	8	177	1781.1
1077	581	5	4	178	1781.4
1078	268	5	6	179	1781.4
1079	374	5	9	180	1784
1080	582	5	2	181	1786.2
1081	583	5	6	182	1787.3
1082	584	5	8	183	1789.1
1083	585	5	1	184	1789.6
1084	461	5	9	185	1802
1085	494	5	3	186	1812.1
1086	586	5	4	187	1817.3
1087	383	5	7	188	1824.2
1088	587	5	4	189	1826.5
1089	588	5	10	190	1827.7
1090	589	5	1	191	1829.6
1091	590	5	2	192	1832.4
1092	399	5	7	193	1834.6
1093	591	5	3	194	1836.7
1094	592	5	6	195	1838.3
1095	593	5	6	196	1840.6
1096	292	5	3	197	1843.8
1097	513	5	9	198	1846.6
1098	474	5	4	199	1854.9
1099	594	5	7	200	1855.9
1100	595	5	9	201	1858.6
1101	596	5	6	202	1863.4
1102	597	5	6	203	1865.3
1103	398	5	1	204	1867.6
1104	598	5	6	205	1871.9
1105	599	5	9	206	1871.9
1106	600	5	9	207	1872.2
1107	601	5	3	208	1874
1108	358	5	3	209	1881.1
1109	602	5	6	210	1885.7
1110	603	5	7	211	1886.4
1111	604	5	7	212	1888.6
1112	605	5	8	213	1900.7
1113	606	5	6	214	1912.4
1114	607	5	6	215	1918.3
1115	407	5	9	216	1937.6
1116	608	5	9	217	1954.7
1117	609	5	8	218	1954.7
1118	392	5	11	219	1967.3
1119	508	5	8	220	2000.3
1120	610	5	9	221	2012.1
1121	514	5	6	222	2023.3
1122	611	5	8	223	2057.4
1123	509	5	7	224	2072.2
1124	612	5	6	225	2073.5
1125	613	5	8	226	2108.4
1126	510	5	7	227	2141.5
1127	323	5	6	228	2165.4
1128	614	5	6	229	2253.1
1129	615	5	9	230	2259.6
1130	325	6	3	1	1487.5
1131	426	6	3	2	1499.8
1132	516	6	3	3	1501.1
1133	432	6	3	4	1502
1134	457	6	1	5	1519.3
1135	431	6	3	6	1527.8
1136	428	6	6	7	1530.1
1137	616	6	1	8	1530.6
1138	517	6	1	9	1531.9
1139	617	6	2	10	1532.9
1140	524	6	4	11	1535.6
1141	475	6	2	12	1557.6
1142	369	6	5	13	1561.1
1143	618	6	9	14	1563
1144	429	6	5	15	1565
1145	523	6	11	16	1566.2
1146	330	6	11	17	1567.6
1147	353	6	2	18	1568.8
1148	619	6	3	19	1571.1
1149	336	6	5	20	1571.6
1150	534	6	1	21	1575.3
1151	518	6	10	22	1576.9
1152	620	6	3	23	1577.4
1153	538	6	4	24	1579.8
1154	430	6	6	25	1580.2
1155	621	6	10	26	1588.2
1156	448	6	6	27	1591.6
1157	450	6	6	28	1593.4
1158	341	6	1	29	1594.2
1159	521	6	2	30	1595.4
1160	352	6	3	31	1602.5
1161	622	6	3	32	1605.6
1162	540	6	4	33	1605.7
1163	537	6	4	34	1606
1164	568	6	6	35	1607.7
1165	525	6	6	36	1608
1166	71	6	2	37	1609.1
1167	354	6	1	38	1609.4
1168	449	6	6	39	1610.8
1169	530	6	9	40	1612.4
1170	458	6	7	41	1613.2
1171	535	6	7	42	1613.4
1172	623	6	3	43	1615.4
1173	624	6	5	44	1616.6
1174	479	6	3	45	1617.8
1175	625	6	1	46	1618.9
1176	440	6	5	47	1619.3
1177	626	6	6	48	1619.4
1178	342	6	8	49	1619.9
1179	533	6	8	50	1622.9
1180	627	6	9	51	1624.3
1181	543	6	5	52	1626.6
1182	445	6	2	53	1627
1183	456	6	2	54	1628.6
1184	396	6	3	55	1628.9
1185	628	6	3	56	1630.3
1186	629	6	2	57	1632.4
1187	411	6	9	58	1633
1188	360	6	6	59	1635.4
1189	362	6	3	60	1636.6
1190	579	6	11	61	1637.4
1191	434	6	2	62	1639.8
1192	546	6	3	63	1640.1
1193	630	6	11	64	1640.5
1194	631	6	6	65	1641.7
1195	446	6	3	66	1642.9
1196	468	6	6	67	1644.1
1197	539	6	6	68	1644.7
1198	436	6	1	69	1645.3
1199	632	6	9	70	1647.6
1200	633	6	2	71	1648
1201	470	6	6	72	1648.8
1202	557	6	2	73	1651.5
1203	453	6	3	74	1651.8
1204	442	6	9	75	1654
1205	532	6	6	76	1654.1
1206	634	6	6	77	1654.6
1207	635	6	1	78	1654.9
1208	444	6	11	79	1655.4
1209	466	6	3	80	1655.7
1210	636	6	1	81	1656.1
1211	333	6	2	82	1658.1
1212	560	6	10	83	1661.8
1213	637	6	3	84	1664.4
1214	638	6	4	85	1666.5
1215	553	6	2	86	1666.8
1216	338	6	9	87	1669.4
1217	474	6	4	88	1670.6
1218	359	6	10	89	1672.2
1219	529	6	3	90	1672.9
1220	528	6	1	91	1676.8
1221	472	6	9	92	1676.9
1222	570	6	10	93	1678.5
1223	555	6	4	94	1679
1224	639	6	1	95	1679.9
1225	544	6	2	96	1680.2
1226	564	6	2	97	1680.9
1227	577	6	2	98	1681.3
1228	467	6	2	99	1681.4
1229	582	6	2	100	1682.5
1230	640	6	2	101	1682.9
1231	554	6	3	102	1684.2
1232	409	6	6	103	1687.5
1233	572	6	3	104	1691.1
1234	536	6	2	105	1691.7
1235	386	6	4	106	1692.9
1236	473	6	3	107	1693.7
1237	641	6	2	108	1694.1
1238	642	6	8	109	1694.4
1239	643	6	3	110	1696.1
1240	644	6	3	111	1696.1
1241	549	6	5	112	1698
1242	469	6	1	113	1698.9
1243	645	6	2	114	1703.4
1244	464	6	6	115	1704.1
1245	571	6	6	116	1704.3
1246	482	6	1	117	1704.8
1247	646	6	9	118	1705.6
1248	647	6	1	119	1705.6
1249	648	6	4	120	1706.2
1250	505	6	4	121	1707.3
1251	551	6	1	122	1708.6
1252	527	6	9	123	1708.8
1253	649	6	6	124	1710.4
1254	650	6	7	125	1710.5
1255	651	6	6	126	1710.6
1256	652	6	4	127	1711.7
1257	563	6	6	128	1712.7
1258	653	6	9	129	1714.2
1259	565	6	3	130	1718.5
1260	495	6	6	131	1719.8
1261	654	6	6	132	1720.2
1262	462	6	4	133	1720.4
1263	655	6	5	134	1720.9
1264	656	6	7	135	1721
1265	502	6	3	136	1722.3
1266	408	6	6	137	1723.9
1267	404	6	3	138	1725.7
1268	541	6	6	139	1726.3
1269	657	6	2	140	1729.9
1270	658	6	10	141	1733.4
1271	659	6	3	142	1734.6
1272	660	6	5	143	1734.7
1273	576	6	9	144	1734.8
1274	661	6	3	145	1735.1
1275	662	6	3	146	1735.4
1276	413	6	3	147	1735.9
1277	663	6	3	148	1738.9
1278	558	6	8	149	1742.7
1279	340	6	4	150	1742.9
1280	664	6	7	151	1743.1
1281	665	6	3	152	1747.1
1282	666	6	5	153	1747.9
1283	438	6	6	154	1750.5
1284	492	6	5	155	1750.6
1285	400	6	1	156	1750.7
1286	667	6	1	157	1751.6
1287	583	6	6	158	1754
1288	668	6	4	159	1754.7
1289	481	6	6	160	1754.7
1290	669	6	1	161	1755.4
1291	670	6	7	162	1757.1
1292	671	6	6	163	1757.9
1293	672	6	1	164	1760.4
1294	587	6	4	165	1761.4
1295	595	6	9	166	1762.1
1296	370	6	1	167	1762.2
1297	580	6	6	168	1766
1298	381	6	1	169	1767.3
1299	673	6	5	170	1769.1
1300	674	6	6	171	1772.7
1301	675	6	11	172	1773.6
1302	398	6	1	173	1777.7
1303	676	6	1	174	1780.5
1304	677	6	6	175	1782
1305	678	6	3	176	1783.9
1306	584	6	8	177	1786.6
1307	601	6	3	178	1792.3
1308	586	6	4	179	1793.3
1309	392	6	11	180	1795.1
1310	608	6	9	181	1797
1311	588	6	10	182	1797.6
1312	679	6	6	183	1799.5
1313	559	6	5	184	1801.1
1314	680	6	3	185	1802.2
1315	415	6	8	186	1804.7
1316	496	6	1	187	1805.2
1317	484	6	3	188	1806.2
1318	681	6	10	189	1806.4
1319	585	6	1	190	1813
1320	561	6	4	191	1816.7
1321	612	6	6	192	1826.7
1322	594	6	7	193	1829.1
1323	682	6	4	194	1834.1
1324	683	6	4	195	1834.5
1325	684	6	6	196	1834.6
1326	573	6	2	197	1834.9
1327	685	6	6	198	1840.2
1328	686	6	11	199	1842.3
1329	388	6	8	200	1842.9
1330	687	6	6	201	1843
1331	374	6	9	202	1844.7
1332	600	6	9	203	1846.1
1333	609	6	8	204	1850.8
1334	688	6	4	205	1856.1
1335	689	6	8	206	1856.9
1336	690	6	6	207	1859.1
1337	487	6	8	208	1859.4
1338	514	6	6	209	1862.4
1339	691	6	6	210	1871
1340	599	6	9	211	1873.6
1341	692	6	9	212	1882.6
1342	693	6	4	213	1888
1343	604	6	7	214	1896.7
1344	694	6	7	215	1900.3
1345	455	6	5	216	1924.1
1346	605	6	8	217	1932.8
1347	695	6	6	218	1938.7
1348	696	6	10	219	1954.8
1349	697	6	7	220	1966.1
1350	698	6	10	221	1977.2
1351	407	6	9	222	1980.8
1352	699	6	1	223	2015.9
1353	700	6	10	224	2173.3
1354	701	6	7	225	2189.7
1355	421	6	8	226	2219.7
1356	615	6	9	227	2334
1357	426	7	3	1	1536.1
1358	457	7	1	2	1544.6
1359	328	7	7	3	1549.8
1360	617	7	2	4	1554.5
1361	427	7	3	5	1561.4
1362	431	7	3	6	1568.8
1363	428	7	6	7	1581.8
1364	517	7	1	8	1583
1365	537	7	4	9	1588.5
1366	565	7	3	10	1594.3
1367	568	7	6	11	1597.6
1368	620	7	3	12	1598.9
1369	524	7	4	13	1600
1370	702	7	2	14	1602.8
1371	619	7	3	15	1604.1
1372	523	7	11	16	1605.9
1373	449	7	6	17	1608.2
1374	530	7	9	18	1608.9
1375	429	7	5	19	1611.6
1376	616	7	1	20	1612
1377	540	7	4	21	1616.1
1378	538	7	4	22	1617.2
1379	529	7	3	23	1618.4
1380	621	7	10	24	1619.8
1381	546	7	3	25	1620.5
1382	623	7	3	26	1625.3
1383	543	7	5	27	1625.6
1384	703	7	3	28	1634.1
1385	518	7	10	29	1634.4
1386	539	7	6	30	1636.6
1387	479	7	3	31	1640.2
1388	475	7	2	32	1641
1389	704	7	7	33	1642.3
1390	705	7	2	34	1644
1391	706	7	2	35	1645
1392	521	7	2	36	1645.6
1393	534	7	1	37	1646.2
1394	637	7	3	38	1647.3
1395	447	7	6	39	1649.8
1396	707	7	3	40	1650.4
1397	631	7	6	41	1651.6
1398	708	7	1	42	1651.6
1399	709	7	2	43	1658
1400	630	7	11	44	1659.1
1401	525	7	6	45	1659.3
1402	710	7	2	46	1660
1403	711	7	3	47	1661
1404	712	7	7	48	1662.3
1405	453	7	3	49	1664.8
1406	434	7	2	50	1665.9
1407	535	7	7	51	1667.8
1408	647	7	1	52	1669.4
1409	445	7	2	53	1672.2
1410	482	7	1	54	1674.9
1411	638	7	4	55	1676
1412	666	7	5	56	1676.3
1413	531	7	9	57	1677.6
1414	713	7	7	58	1677.7
1415	450	7	6	59	1679.5
1416	629	7	2	60	1680.4
1417	564	7	2	61	1683.9
1418	714	7	5	62	1684.3
1419	715	7	9	63	1685
1420	640	7	2	64	1688.4
1421	716	7	6	65	1688.9
1422	436	7	1	66	1690.7
1423	717	7	2	67	1692.2
1424	444	7	11	68	1696.5
1425	718	7	4	69	1697.6
1426	468	7	6	70	1699.5
1427	675	7	11	71	1700
1428	719	7	3	72	1701.3
1429	470	7	6	73	1701.5
1430	643	7	3	74	1702.2
1431	720	7	2	75	1702.6
1432	478	7	7	76	1702.6
1433	721	7	3	77	1703
1434	467	7	2	78	1704.1
1435	722	7	2	79	1705.4
1436	723	7	1	80	1705.6
1437	442	7	9	81	1706.5
1438	505	7	4	82	1706.7
1439	544	7	2	83	1707.9
1440	641	7	2	84	1708.5
1441	724	7	7	85	1708.7
1442	634	7	6	86	1708.8
1443	639	7	1	87	1709.6
1444	557	7	2	88	1709.9
1445	635	7	1	89	1710
1446	725	7	3	90	1710.2
1447	551	7	1	91	1711.4
1448	662	7	3	92	1711.7
1449	469	7	1	93	1713.7
1450	655	7	5	94	1715.7
1451	555	7	4	95	1718.6
1452	541	7	6	96	1719.5
1453	553	7	2	97	1719.7
1454	466	7	3	98	1723.9
1455	672	7	1	99	1724.4
1456	664	7	7	100	1728.7
1457	726	7	2	101	1728.7
1458	645	7	2	102	1729.8
1459	464	7	6	103	1731.6
1460	502	7	3	104	1732.5
1461	727	7	11	105	1732.9
1462	728	7	6	106	1733.6
1463	729	7	6	107	1735.3
1464	730	7	6	108	1736.2
1465	731	7	3	109	1736.3
1466	573	7	2	110	1738.1
1467	572	7	3	111	1738.3
1468	689	7	8	112	1738.8
1469	549	7	5	113	1741.2
1470	654	7	6	114	1741.6
1471	625	7	1	115	1742.3
1472	576	7	9	116	1743.1
1473	732	7	5	117	1743.3
1474	653	7	9	118	1743.6
1475	496	7	1	119	1745.1
1476	733	7	8	120	1746.2
1477	734	7	7	121	1746.5
1478	735	7	9	122	1748.7
1479	440	7	5	123	1748.8
1480	736	7	1	124	1750.4
1481	737	7	8	125	1752.5
1482	473	7	3	126	1753.2
1483	561	7	4	127	1753.6
1484	660	7	5	128	1754.6
1485	536	7	2	129	1756.3
1486	738	7	3	130	1757.4
1487	563	7	6	131	1758.3
1488	570	7	10	132	1758.5
1489	739	7	3	133	1759.7
1490	740	7	6	134	1759.8
1491	649	7	6	135	1761.2
1492	659	7	3	136	1761.8
1493	658	7	10	137	1762.3
1494	741	7	6	138	1765.8
1495	582	7	2	139	1765.8
1496	646	7	9	140	1767.6
1497	742	7	4	141	1768.2
1498	743	7	6	142	1770.2
1499	744	7	3	143	1772.9
1500	474	7	4	144	1773.1
1501	745	7	9	145	1774.6
1502	746	7	7	146	1775.7
1503	747	7	6	147	1776.4
1504	652	7	4	148	1776.5
1505	520	7	8	149	1779.7
1506	661	7	3	150	1780.2
1507	678	7	3	151	1780.2
1508	562	7	2	152	1780.6
1509	577	7	2	153	1782.9
1510	748	7	2	154	1783.9
1511	588	7	10	155	1784.5
1512	677	7	6	156	1786.2
1513	749	7	4	157	1787.9
1514	628	7	3	158	1788.5
1515	750	7	3	159	1789.6
1516	751	7	3	160	1790.1
1517	663	7	3	161	1790.9
1518	752	7	5	162	1791.4
1519	657	7	2	163	1791.7
1520	688	7	4	164	1792.5
1521	753	7	1	165	1794.6
1522	754	7	9	166	1794.6
1523	755	7	1	167	1796.9
1524	644	7	3	168	1802.2
1525	756	7	3	169	1803.3
1526	462	7	4	170	1803.7
1527	757	7	4	171	1803.8
1528	656	7	7	172	1806.7
1529	758	7	3	173	1806.9
1530	472	7	9	174	1810.4
1531	759	7	6	175	1816.3
1532	492	7	5	176	1820.3
1533	760	7	8	177	1821.6
1534	446	7	3	178	1821.7
1535	676	7	1	179	1822
1536	761	7	1	180	1822.2
1537	459	7	10	181	1824.1
1538	665	7	3	182	1824.2
1539	762	7	2	183	1824.7
1540	763	7	6	184	1825.2
1541	585	7	1	185	1825.5
1542	764	7	1	186	1836.6
1543	765	7	9	187	1838.5
1544	766	7	4	188	1842.3
1545	767	7	2	189	1843.5
1546	692	7	9	190	1847
1547	514	7	6	191	1847
1548	587	7	4	192	1848.5
1549	768	7	1	193	1850.3
1550	769	7	10	194	1851.2
1551	669	7	1	195	1853
1552	489	7	6	196	1855.2
1553	770	7	6	197	1858.7
1554	484	7	3	198	1860.2
1555	771	7	5	199	1864.4
1556	772	7	4	200	1865.1
1557	609	7	8	201	1868.3
1558	773	7	10	202	1869.9
1559	774	7	9	203	1872.9
1560	608	7	9	204	1873
1561	775	7	8	205	1873.2
1562	776	7	1	206	1875.1
1563	670	7	7	207	1875.2
1564	682	7	4	208	1876.6
1565	777	7	2	209	1877.4
1566	601	7	3	210	1881.8
1567	695	7	6	211	1886.8
1568	600	7	9	212	1894.3
1569	778	7	4	213	1895.7
1570	584	7	8	214	1903.4
1571	779	7	4	215	1911.2
1572	775	7	7	216	1925.1
1573	604	7	7	217	1928
1574	694	7	7	218	1935.2
1575	780	7	1	219	1945.5
1576	781	7	9	220	1958.4
1577	782	7	9	221	1964.9
1578	594	7	7	222	1971.6
1579	783	7	5	223	1972.6
1580	784	7	9	224	1979.2
1581	691	7	6	225	1991.1
1582	785	7	8	226	1991.8
1583	786	7	11	227	1991.8
1584	693	7	4	228	1994.3
1585	787	7	10	229	2011.1
1586	788	7	8	230	2021.7
1587	559	7	5	231	2023.6
1588	613	7	8	232	2046.2
1589	698	7	10	233	2080.8
1590	487	7	8	234	2095.4
1591	700	7	10	235	2586.9
1592	565	8	3	1	1556.9
1593	568	8	6	2	1566.6
1594	523	8	11	3	1568.8
1595	789	8	4	4	1576.2
1596	703	8	3	5	1577.3
1597	790	8	4	6	1578.8
1598	521	8	2	7	1589.5
1599	525	8	6	8	1596.1
1600	791	8	6	9	1601.9
1601	711	8	3	10	1603.2
1602	792	8	1	11	1605.1
1603	546	8	3	12	1605.5
1604	793	8	4	13	1606.6
1605	708	8	1	14	1607.1
1606	534	8	1	15	1607.3
1607	794	8	3	16	1608.3
1608	543	8	5	17	1609.5
1609	725	8	3	18	1611.3
1610	621	8	10	19	1613.1
1611	662	8	3	20	1614.2
1612	539	8	6	21	1615
1613	718	8	4	22	1617.5
1614	705	8	2	23	1617.9
1615	564	8	2	24	1619.8
1616	795	8	5	25	1622.1
1617	631	8	6	26	1622.4
1618	530	8	9	27	1622.6
1619	722	8	2	28	1623.5
1620	629	8	2	29	1623.6
1621	704	8	7	30	1625.7
1622	709	8	2	31	1626.7
1623	638	8	4	32	1631
1624	796	8	5	33	1631.8
1625	719	8	3	34	1636.6
1626	630	8	11	35	1638.3
1627	578	8	6	36	1639.6
1628	561	8	4	37	1641.6
1629	648	8	4	38	1642.3
1630	675	8	11	39	1649.9
1631	797	8	7	40	1650.3
1632	732	8	5	41	1650.6
1633	717	8	2	42	1650.6
1634	714	8	5	43	1652.1
1635	735	8	9	44	1652.4
1636	447	8	6	45	1654.4
1637	664	8	7	46	1657.6
1638	798	8	9	47	1658.4
1639	799	8	2	48	1659.3
1640	800	8	8	49	1659.5
1641	570	8	10	50	1660.4
1642	555	8	4	51	1661.1
1643	801	8	2	52	1661.1
1644	647	8	1	53	1662.4
1645	721	8	3	54	1665
1646	729	8	6	55	1665.6
1647	644	8	3	56	1665.8
1648	724	8	7	57	1666.1
1649	802	8	6	58	1666.3
1650	803	8	3	59	1667
1651	723	8	1	60	1670.5
1652	804	8	9	61	1673
1653	805	8	3	62	1673.9
1654	806	8	7	63	1674.1
1655	520	8	8	64	1675.7
1656	807	8	2	65	1676.3
1657	716	8	6	66	1677.8
1658	726	8	2	67	1678.5
1659	637	8	3	68	1679.1
1660	620	8	3	69	1681.3
1661	666	8	5	70	1681.9
1662	672	8	1	71	1683.3
1663	572	8	3	72	1683.8
1664	808	8	1	73	1686.4
1665	747	8	6	74	1687.4
1666	582	8	2	75	1687.9
1667	571	8	6	76	1688.2
1668	730	8	6	77	1690.5
1669	809	8	7	78	1690.9
1670	536	8	2	79	1692.9
1671	810	8	4	80	1693.7
1672	811	8	4	81	1695
1673	656	8	7	82	1695.9
1674	635	8	1	83	1697.1
1675	663	8	3	84	1697.3
1676	557	8	2	85	1699.2
1677	563	8	6	86	1699.2
1678	553	8	2	87	1699.3
1679	812	8	9	88	1699.4
1680	529	8	3	89	1699.7
1681	741	8	6	90	1701.7
1682	628	8	3	91	1704
1683	813	8	1	92	1705.1
1684	544	8	2	93	1706.2
1685	814	8	2	94	1708.9
1686	579	8	11	95	1711.1
1687	740	8	6	96	1711.9
1688	815	8	6	97	1713
1689	654	8	6	98	1715.7
1690	816	8	3	99	1718.1
1691	655	8	5	100	1718.7
1692	817	8	2	101	1719.3
1693	818	8	4	102	1720.2
1694	819	8	2	103	1721.6
1695	736	8	1	104	1721.6
1696	577	8	2	105	1722.4
1697	755	8	1	106	1723.1
1698	576	8	9	107	1725.3
1699	758	8	3	108	1725.9
1700	680	8	3	109	1726.3
1701	820	8	1	110	1726.8
1702	707	8	3	111	1727.8
1703	821	8	3	112	1731.5
1704	822	8	9	113	1732.4
1705	738	8	3	114	1733.3
1706	619	8	3	115	1736.6
1707	823	8	3	116	1739.6
1708	824	8	3	117	1741
1709	825	8	7	118	1741.2
1710	826	8	1	119	1742.2
1711	640	8	2	120	1745.1
1712	670	8	7	121	1745.2
1713	827	8	1	122	1746.7
1714	828	8	3	123	1747.3
1715	623	8	3	124	1747.3
1716	661	8	3	125	1750
1717	759	8	6	126	1750.8
1718	829	8	9	127	1752.4
1719	830	8	4	128	1754.3
1720	831	8	1	129	1754.9
1721	688	8	4	130	1756
1722	745	8	9	131	1756.4
1723	737	8	8	132	1762.2
1724	832	8	1	133	1763.6
1725	833	8	7	134	1766.4
1726	734	8	7	135	1767.2
1727	773	8	10	136	1769.8
1728	560	8	10	137	1770.9
1729	608	8	9	138	1771.8
1730	834	8	4	139	1772
1731	754	8	9	140	1773.7
1732	835	8	3	141	1773.8
1733	772	8	4	142	1776.4
1734	673	8	5	143	1778
1735	836	8	3	144	1778.9
1736	837	8	11	145	1780.7
1737	657	8	2	146	1781
1738	838	8	4	147	1784
1739	678	8	3	148	1784.4
1740	768	8	1	149	1786.2
1741	839	8	8	150	1786.7
1742	771	8	5	151	1786.9
1743	587	8	4	152	1787.4
1744	573	8	2	153	1789.1
1745	551	8	1	154	1789.8
1746	840	8	2	155	1790
1747	559	8	5	156	1791.1
1748	779	8	4	157	1792.9
1749	600	8	9	158	1795
1750	609	8	8	159	1796.5
1751	841	8	2	160	1800.7
1752	842	8	10	161	1800.9
1753	763	8	6	162	1803.4
1754	665	8	3	163	1807.7
1755	843	8	7	164	1810.1
1756	687	8	6	165	1811.4
1757	844	8	9	166	1811.9
1758	642	8	8	167	1815.2
1759	845	8	6	168	1816.6
1760	846	8	3	169	1816.7
1761	692	8	9	170	1818.1
1762	847	8	6	171	1826.3
1763	580	8	6	172	1829.1
1764	848	8	9	173	1835
1765	849	8	6	174	1837.5
1766	850	8	5	175	1839.7
1767	851	8	3	176	1845.6
1768	852	8	8	177	1846.3
1769	778	8	4	178	1846.4
1770	785	8	8	179	1847.3
1771	853	8	3	180	1847.7
1772	854	8	3	181	1850.6
1773	774	8	9	182	1851.9
1774	855	8	4	183	1854.5
1775	683	8	4	184	1859.1
1776	856	8	2	185	1861.7
1777	857	8	4	186	1864.2
1778	783	8	5	187	1869.5
1779	858	8	6	188	1874.9
1780	775	8	7	189	1880
1781	769	8	10	190	1889.2
1782	604	8	7	191	1898.6
1783	693	8	4	192	1913.1
1784	859	8	10	193	1913.4
1785	782	8	9	194	1926.1
1786	762	8	2	195	1927.9
1787	788	8	8	196	1929
1788	610	8	9	197	1935.6
1789	860	8	8	198	1938.7
1790	861	8	5	199	1942.3
1791	584	8	8	200	1949.1
1792	862	8	10	201	1952.3
1793	784	8	9	202	1955.1
1794	863	8	8	203	1973.7
1795	864	8	4	204	1981.7
1796	865	8	11	205	2002.6
1797	866	8	5	206	2174.6
1798	867	8	10	207	2263.2
1799	868	8	10	208	2726
1800	616	9	1	1	1522.4
1801	725	9	3	2	1541.4
1802	869	9	1	3	1546.8
1803	620	9	3	4	1551.4
1804	870	9	4	5	1552.4
1805	871	9	1	6	1560.6
1806	708	9	1	7	1563.5
1807	631	9	6	8	1565.3
1808	792	9	1	9	1566.7
1809	872	9	5	10	1573.2
1810	738	9	3	11	1575.3
1811	630	9	11	12	1582.3
1812	814	9	2	13	1585
1813	619	9	3	14	1590.4
1814	711	9	3	15	1593.1
1815	873	9	5	16	1595.9
1816	735	9	9	17	1597
1817	874	9	7	18	1597.7
1818	800	9	8	19	1598.6
1819	798	9	9	20	1602.9
1820	721	9	3	21	1604.3
1821	634	9	6	22	1605.8
1822	719	9	3	23	1606.4
1823	791	9	6	24	1606.8
1824	647	9	1	25	1607.4
1825	705	9	2	26	1607.7
1826	741	9	6	27	1608.3
1827	716	9	6	28	1611.6
1828	664	9	7	29	1611.9
1829	732	9	5	30	1613.8
1830	640	9	2	31	1616.5
1831	875	9	7	32	1617.6
1832	629	9	2	33	1618.9
1833	801	9	2	34	1619.5
1834	535	9	7	35	1621.4
1835	718	9	4	36	1621.5
1836	876	9	2	37	1624.8
1837	805	9	3	38	1625.9
1838	807	9	2	39	1627.3
1839	812	9	9	40	1628.4
1840	877	9	3	41	1630.3
1841	878	9	3	42	1630.5
1842	730	9	6	43	1631.7
1843	747	9	6	44	1632.2
1844	806	9	7	45	1632.3
1845	879	9	4	46	1634.1
1846	678	9	3	47	1634.4
1847	648	9	4	48	1634.8
1848	880	9	7	49	1636.2
1849	829	9	9	50	1637.4
1850	881	9	4	51	1638.3
1851	799	9	2	52	1638.7
1852	803	9	3	53	1639
1853	656	9	7	54	1640.2
1854	882	9	8	55	1640.3
1855	883	9	7	56	1641.1
1856	836	9	3	57	1641.2
1857	707	9	3	58	1641.3
1858	709	9	2	59	1642.8
1859	884	9	6	60	1643.8
1860	885	9	6	61	1644.6
1861	808	9	1	62	1647.4
1862	886	9	9	63	1651.1
1863	675	9	11	64	1653.6
1864	794	9	3	65	1653.6
1865	887	9	4	66	1655.5
1866	746	9	7	67	1655.9
1867	666	9	5	68	1656.1
1868	828	9	3	69	1656.7
1869	888	9	6	70	1659.6
1870	737	9	8	71	1662.4
1871	889	9	7	72	1662.5
1872	714	9	5	73	1663.1
1873	890	9	6	74	1664
1874	891	9	8	75	1665.2
1875	745	9	9	76	1667.6
1876	777	9	2	77	1670.3
1877	892	9	4	78	1672.6
1878	893	9	8	79	1674.8
1879	819	9	2	80	1675.4
1880	809	9	7	81	1677.6
1881	894	9	7	82	1678.2
1882	895	9	9	83	1678.4
1883	734	9	7	84	1679.4
1884	896	9	3	85	1680.9
1885	762	9	2	86	1681.1
1886	821	9	3	87	1682.3
1887	897	9	11	88	1685.9
1888	663	9	3	89	1686.5
1889	646	9	9	90	1687.1
1890	835	9	3	91	1688.4
1891	839	9	8	92	1694.4
1892	759	9	6	93	1695.4
1893	662	9	3	94	1696
1894	751	9	3	95	1697
1895	826	9	1	96	1697.3
1896	834	9	4	97	1698.1
1897	849	9	6	98	1698.9
1898	837	9	11	99	1699
1899	726	9	2	100	1699.5
1900	758	9	3	101	1699.8
1901	672	9	1	102	1702.6
1902	898	9	11	103	1706.5
1903	899	9	1	104	1707.6
1904	900	9	3	105	1708.3
1905	661	9	3	106	1708.4
1906	831	9	1	107	1708.8
1907	901	9	6	108	1709.5
1908	902	9	7	109	1710.8
1909	903	9	3	110	1717.2
1910	904	9	3	111	1717.6
1911	905	9	3	112	1719.2
1912	692	9	9	113	1720.4
1913	906	9	8	114	1720.5
1914	832	9	1	115	1720.5
1915	773	9	10	116	1721
1916	907	9	10	117	1721.2
1917	769	9	10	118	1724.5
1918	908	9	1	119	1725.7
1919	909	9	3	120	1726
1920	910	9	3	121	1726.8
1921	911	9	6	122	1727.3
1922	912	9	9	123	1727.6
1923	848	9	9	124	1728.4
1924	815	9	6	125	1728.7
1925	913	9	5	126	1729.1
1926	914	9	4	127	1729.7
1927	915	9	11	128	1730.8
1928	660	9	5	129	1731.5
1929	916	9	3	130	1732.1
1930	917	9	11	131	1732.3
1931	918	9	3	132	1736.6
1932	657	9	2	133	1736.8
1933	772	9	4	134	1741.2
1934	754	9	9	135	1743.8
1935	636	9	1	136	1747.6
1936	677	9	6	137	1750.4
1937	749	9	4	138	1751
1938	919	9	1	139	1751.7
1939	920	9	4	140	1752.1
1940	843	9	7	141	1756
1941	921	9	2	142	1758.3
1942	922	9	3	143	1762.2
1943	739	9	3	144	1764.8
1944	846	9	3	145	1765.6
1945	628	9	3	146	1766.6
1946	683	9	4	147	1770.4
1947	665	9	3	148	1770.6
1948	923	9	5	149	1771.7
1949	642	9	8	150	1773
1950	924	9	10	151	1774.3
1951	925	9	1	152	1776.3
1952	637	9	3	153	1776.9
1953	926	9	9	154	1779.2
1954	768	9	1	155	1781.5
1955	824	9	3	156	1782.4
1956	851	9	3	157	1782.8
1957	676	9	1	158	1783.7
1958	673	9	5	159	1784.1
1959	927	9	10	160	1785.9
1960	854	9	3	161	1788
1961	820	9	1	162	1788.2
1962	928	9	6	163	1790
1963	929	9	4	164	1791
1964	930	9	7	165	1791.8
1965	931	9	2	166	1793.4
1966	932	9	3	167	1798.2
1967	782	9	9	168	1798.6
1968	688	9	4	169	1799.6
1969	852	9	8	170	1803.6
1970	659	9	3	171	1804.5
1971	654	9	6	172	1805.4
1972	933	9	7	173	1806.8
1973	934	9	9	174	1809.1
1974	779	9	4	175	1812.4
1975	935	9	6	176	1814.7
1976	936	9	7	177	1821.7
1977	937	9	9	178	1827.9
1978	938	9	6	179	1829.4
1979	778	9	4	180	1834.4
1980	939	9	6	181	1838.8
1981	940	9	7	182	1839.5
1982	941	9	4	183	1841.5
1983	695	9	6	184	1852.5
1984	845	9	6	185	1858.5
1985	857	9	4	186	1858.6
1986	942	9	5	187	1859.2
1987	855	9	4	188	1862.5
1988	943	9	7	189	1878.3
1989	944	9	8	190	1879.7
1990	860	9	8	191	1882.2
1991	945	9	9	192	1895.1
1992	861	9	5	193	1906.3
1993	623	9	3	194	1908.3
1994	946	9	3	195	1914.2
1995	947	9	5	196	1925.4
1996	948	9	8	197	1937.2
1997	784	9	9	198	1959.4
1998	949	9	9	199	1968.2
1999	787	9	10	200	1976.3
2000	865	9	11	201	2024.7
2001	950	9	3	202	2046
2002	951	9	11	203	2117.8
2003	869	10	1	1	1510.4
2004	708	10	1	2	1523.9
2005	792	10	1	3	1533.8
2006	814	10	2	4	1539.2
2007	711	10	3	5	1549.6
2008	871	10	1	6	1550.9
2009	725	10	3	7	1551.1
2010	880	10	7	8	1564
2011	805	10	3	9	1567.8
2012	719	10	3	10	1569.3
2013	705	10	2	11	1571.2
2014	877	10	3	12	1575.3
2015	952	10	2	13	1575.4
2016	876	10	2	14	1580.4
2017	870	10	4	15	1581.2
2018	803	10	3	16	1585.4
2019	882	10	8	17	1587.5
2020	741	10	6	18	1587.5
2021	747	10	6	19	1590
2022	896	10	3	20	1590.4
2023	953	10	1	21	1592.8
2024	888	10	6	22	1593.2
2025	872	10	5	23	1598
2026	954	10	2	24	1603
2027	704	10	7	25	1607.6
2028	955	10	3	26	1608.8
2029	956	10	7	27	1612.5
2030	730	10	6	28	1614.2
2031	798	10	9	29	1616.9
2032	878	10	3	30	1617.4
2033	732	10	5	31	1620.5
2034	883	10	7	32	1621.9
2035	874	10	7	33	1623.9
2036	957	10	1	34	1627
2037	958	10	7	35	1631.9
2038	721	10	3	36	1633.6
2039	807	10	2	37	1636.7
2040	808	10	1	38	1639.2
2041	959	10	2	39	1641.4
2042	960	10	4	40	1641.6
2043	812	10	9	41	1643.1
2044	961	10	10	42	1644.1
2045	886	10	9	43	1644.7
2046	819	10	2	44	1645.5
2047	962	10	8	45	1646.5
2048	963	10	4	46	1646.7
2049	800	10	8	47	1647.3
2050	885	10	6	48	1648
2051	794	10	3	49	1648.9
2052	964	10	4	50	1654.2
2053	735	10	9	51	1656
2054	965	10	4	52	1656.7
2055	748	10	2	53	1658
2056	919	10	1	54	1658.1
2057	891	10	8	55	1658.3
2058	966	10	6	56	1659.4
2059	967	10	2	57	1663.2
2060	734	10	7	58	1665
2061	968	10	1	59	1665.7
2062	906	10	8	60	1666.2
2063	815	10	6	61	1666.4
2064	915	10	11	62	1668.5
2065	969	10	3	63	1671
2066	902	10	7	64	1671.7
2067	970	10	2	65	1671.8
2068	828	10	3	66	1672.9
2069	971	10	6	67	1673.3
2070	972	10	9	68	1675.7
2071	835	10	3	69	1676
2072	718	10	4	70	1679
2073	973	10	2	71	1679.3
2074	974	10	6	72	1679.5
2075	884	10	6	73	1680.9
2076	875	10	7	74	1681.8
2077	745	10	9	75	1682.1
2078	975	10	2	76	1683.2
2079	879	10	4	77	1683.3
2080	755	10	1	78	1684.4
2081	897	10	11	79	1685.4
2082	746	10	7	80	1686.8
2083	976	10	9	81	1687.2
2084	821	10	3	82	1689.3
2085	881	10	4	83	1689.3
2086	716	10	6	84	1689.9
2087	739	10	3	85	1692.5
2088	977	10	3	86	1694.3
2089	892	10	4	87	1695
2090	916	10	3	88	1695.1
2091	917	10	11	89	1699
2092	843	10	7	90	1701.8
2093	978	10	4	91	1701.9
2094	979	10	4	92	1710.7
2095	980	10	4	93	1711.6
2096	820	10	1	94	1711.9
2097	913	10	5	95	1712.9
2098	928	10	6	96	1717.7
2099	981	10	7	97	1719.1
2100	829	10	9	98	1719.9
2101	982	10	5	99	1721.4
2102	920	10	4	100	1724.2
2103	941	10	4	101	1726.7
2104	846	10	3	102	1727.2
2105	773	10	10	103	1728.1
2106	983	10	6	104	1728.6
2107	743	10	6	105	1728.8
2108	984	10	7	106	1729.1
2109	985	10	2	107	1729.7
2110	986	10	3	108	1731
2111	817	10	2	109	1733.2
2112	987	10	6	110	1736.7
2113	988	10	7	111	1738.9
2114	749	10	4	112	1743.5
2115	763	10	6	113	1745
2116	989	10	8	114	1745.6
2117	900	10	3	115	1746.9
2118	898	10	11	116	1748.4
2119	990	10	6	117	1749
2120	991	10	4	118	1749.9
2121	914	10	4	119	1751.2
2122	834	10	4	120	1751.4
2123	992	10	4	121	1752
2124	950	10	3	122	1754.7
2125	993	10	1	123	1754.9
2126	994	10	5	124	1756.5
2127	809	10	7	125	1757.8
2128	889	10	7	126	1759.9
2129	827	10	1	127	1760.2
2130	995	10	1	128	1760.4
2131	996	10	1	129	1761
2132	997	10	7	130	1763.4
2133	938	10	6	131	1766.7
2134	852	10	8	132	1767.4
2135	851	10	3	133	1767.7
2136	738	10	3	134	1769.1
2137	762	10	2	135	1769.9
2138	854	10	3	136	1770.4
2139	314	10	8	137	1771.1
2140	998	10	2	138	1771.5
2141	758	10	3	139	1771.8
2142	999	10	3	140	1772.5
2143	1000	10	6	141	1773.1
2144	1001	10	7	142	1773.7
2145	912	10	9	143	1774.6
2146	1002	10	9	144	1775.6
2147	1003	10	4	145	1777.2
2148	806	10	7	146	1777.2
2149	1004	10	2	147	1780
2150	848	10	9	148	1784.3
2151	895	10	9	149	1785.7
2152	921	10	2	150	1786.9
2153	1005	10	9	151	1787.9
2154	927	10	10	152	1789
2155	930	10	7	153	1794.4
2156	894	10	7	154	1795.1
2157	1006	10	3	155	1796.2
2158	942	10	5	156	1798.9
2159	943	10	7	157	1802.7
2160	905	10	3	158	1802.8
2161	844	10	9	159	1803.6
2162	947	10	5	160	1808.6
2163	903	10	3	161	1810.4
2164	754	10	9	162	1812.2
2165	1007	10	10	163	1814
2166	1008	10	3	164	1815.1
2167	1009	10	1	165	1818.3
2168	1010	10	7	166	1823
2169	1011	10	6	167	1824.9
2170	1012	10	3	168	1825.4
2171	837	10	11	169	1825.7
2172	855	10	4	170	1827.3
2173	934	10	9	171	1829.5
2174	936	10	7	172	1830.2
2175	1013	10	2	173	1830.4
2176	949	10	9	174	1833.6
2177	935	10	6	175	1837.4
2178	911	10	6	176	1838
2179	772	10	4	177	1842.9
2180	940	10	7	178	1849.7
2181	1014	10	11	179	1852.1
2182	1015	10	4	180	1854.8
2183	1016	10	8	181	1856.5
2184	1017	10	3	182	1857.2
2185	1018	10	3	183	1858
2186	1019	10	3	184	1864.3
2187	784	10	9	185	1865.3
2188	1020	10	5	186	1865.8
2189	779	10	4	187	1867.4
2190	1021	10	9	188	1868.3
2191	768	10	1	189	1870.4
2192	1022	10	5	190	1872.7
2193	931	10	2	191	1876.7
2194	862	10	10	192	1887.4
2195	778	10	4	193	1899
2196	860	10	8	194	1903
2197	1023	10	4	195	1909.3
2198	924	10	10	196	1918.3
2199	857	10	4	197	1941.4
2200	1024	10	6	198	1965.3
2201	1025	10	3	199	1969.4
2202	865	10	11	200	2060.8
2203	871	11	1	1	1477.4
2204	869	11	1	2	1499
2205	814	11	2	3	1505.4
2206	873	11	5	4	1507.7
2207	872	11	5	5	1512.1
2208	836	11	3	6	1518.5
2209	877	11	3	7	1519.6
2210	792	11	1	8	1519.7
2211	1026	11	2	9	1530.4
2212	880	11	7	10	1533.1
2213	805	11	3	11	1537.3
2214	964	11	4	12	1544.7
2215	954	11	2	13	1547.1
2216	870	11	4	14	1553.7
2217	958	11	7	15	1556.7
2218	1027	11	2	16	1560
2219	791	11	6	17	1562.4
2220	1028	11	3	18	1563.1
2221	968	11	1	19	1564.8
2222	957	11	1	20	1567.5
2223	965	11	4	21	1570.4
2224	952	11	2	22	1570.7
2225	1029	11	1	23	1571.1
2226	800	11	8	24	1572
2227	1030	11	6	25	1574.2
2228	888	11	6	26	1575.7
2229	1031	11	3	27	1577.2
2230	1032	11	1	28	1578.1
2231	960	11	4	29	1579.7
2232	969	11	3	30	1582.7
2233	807	11	2	31	1587.9
2234	1033	11	3	32	1589
2235	896	11	3	33	1590.7
2236	941	11	4	34	1591.3
2237	966	11	6	35	1592.5
2238	886	11	9	36	1594.3
2239	992	11	4	37	1598.4
2240	1012	11	3	38	1598.8
2241	1034	11	1	39	1598.9
2242	973	11	2	40	1600.9
2243	882	11	8	41	1603.2
2244	953	11	1	42	1604.4
2245	1035	11	2	43	1606.8
2246	909	11	3	44	1608.1
2247	977	11	3	45	1608.2
2248	1036	11	2	46	1609.6
2249	955	11	3	47	1610.1
2250	1037	11	10	48	1610.7
2251	1038	11	1	49	1613.3
2252	978	11	4	50	1615.9
2253	1039	11	2	51	1616.4
2254	1040	11	6	52	1616.9
2255	803	11	3	53	1618
2256	913	11	5	54	1618.2
2257	903	11	3	55	1618.7
2258	891	11	8	56	1619.7
2259	1041	11	1	57	1619.8
2260	876	11	2	58	1619.9
2261	1042	11	5	59	1621.1
2262	982	11	5	60	1621.5
2263	889	11	7	61	1622.7
2264	812	11	9	62	1624
2265	1043	11	8	63	1624.1
2266	987	11	6	64	1625
2267	875	11	7	65	1625.8
2268	971	11	6	66	1626.5
2269	979	11	4	67	1627.1
2270	919	11	1	68	1628.8
2271	976	11	9	69	1629.7
2272	1044	11	8	70	1631.5
2273	906	11	8	71	1633.1
2274	1045	11	4	72	1633.7
2275	1046	11	3	73	1633.7
2276	994	11	5	74	1633.9
2277	794	11	3	75	1637.7
2278	999	11	3	76	1639.1
2279	901	11	6	77	1639.3
2280	894	11	7	78	1639.8
2281	980	11	4	79	1642
2282	826	11	1	80	1642.1
2283	1047	11	1	81	1642.1
2284	916	11	3	82	1642.4
2285	895	11	9	83	1642.7
2286	1048	11	8	84	1644.2
2287	897	11	11	85	1644.4
2288	884	11	6	86	1644.5
2289	1049	11	3	87	1644.7
2290	963	11	4	88	1644.8
2291	983	11	6	89	1645.2
2292	844	11	9	90	1646.3
2293	1050	11	8	91	1647.4
2294	809	11	7	92	1648.4
2295	925	11	1	93	1649.9
2296	843	11	7	94	1651.5
2297	1051	11	7	95	1652.6
2298	1052	11	2	96	1655.7
2299	962	11	8	97	1656.2
2300	972	11	9	98	1656.7
2301	828	11	3	99	1656.8
2302	1053	11	2	100	1658.2
2303	922	11	3	101	1659.6
2304	1054	11	1	102	1661
2305	892	11	4	103	1661.4
2306	1055	11	5	104	1661.6
2307	944	11	8	105	1665.3
2308	1056	11	1	106	1666.9
2309	1057	11	6	107	1667.5
2310	915	11	11	108	1668.5
2311	1018	11	3	109	1669.1
2312	920	11	4	110	1670.6
2313	1003	11	4	111	1671.2
2314	1058	11	3	112	1673.1
2315	885	11	6	113	1674.2
2316	1059	11	6	114	1675.5
2317	997	11	7	115	1678.4
2318	914	11	4	116	1680.3
2319	1060	11	6	117	1682.6
2320	1001	11	7	118	1682.9
2321	832	11	1	119	1683.9
2322	1061	11	10	120	1684.7
2323	993	11	1	121	1685.1
2324	1006	11	3	122	1687.2
2325	829	11	9	123	1687.7
2326	815	11	6	124	1688.5
2327	852	11	8	125	1691.3
2328	879	11	4	126	1693.1
2329	912	11	9	127	1693.9
2330	1062	11	3	128	1694.2
2331	1063	11	2	129	1694.3
2332	937	11	9	130	1696.7
2333	950	11	3	131	1697
2334	1013	11	2	132	1697.9
2335	887	11	4	133	1699.1
2336	984	11	7	134	1700
2337	1064	11	4	135	1700
2338	835	11	3	136	1701.3
2339	1065	11	10	137	1702.8
2340	827	11	1	138	1704.9
2341	1066	11	4	139	1706.3
2342	855	11	4	140	1706.8
2343	1067	11	8	141	1707.5
2344	899	11	1	142	1707.7
2345	1068	11	11	143	1708.8
2346	1069	11	7	144	1711.8
2347	975	11	2	145	1712
2348	928	11	6	146	1714.3
2349	1070	11	1	147	1715.3
2350	991	11	4	148	1716.3
2351	1071	11	5	149	1716.8
2352	934	11	9	150	1718.8
2353	931	11	2	151	1720.7
2354	1022	11	5	152	1722.2
2355	1072	11	4	153	1730.5
2356	1073	11	2	154	1732.3
2357	1074	11	6	155	1732.4
2358	848	11	9	156	1734.4
2359	905	11	3	157	1734.5
2360	1075	11	1	158	1736.1
2361	314	11	8	159	1742.8
2362	1076	11	11	160	1744
2363	1077	11	3	161	1746
2364	1078	11	7	162	1748.4
2365	938	11	6	163	1749.4
2366	1079	11	1	164	1751
2367	918	11	3	165	1752.1
2368	949	11	9	166	1752.6
2369	900	11	3	167	1755.4
2370	1016	11	8	168	1756.3
2371	1080	11	9	169	1756.9
2372	1015	11	4	170	1757.7
2373	996	11	1	171	1758.8
2374	1081	11	4	172	1769.4
2375	846	11	3	173	1770.5
2376	1082	11	11	174	1770.9
2377	1083	11	8	175	1771.5
2378	1004	11	2	176	1773.1
2379	1084	11	2	177	1773.9
2380	851	11	3	178	1780.2
2381	1000	11	6	179	1784.3
2382	1008	11	3	180	1786.1
2383	1085	11	4	181	1786.8
2384	1086	11	2	182	1789.6
2385	1087	11	9	183	1790.3
2386	990	11	6	184	1791.1
2387	1019	11	3	185	1791.4
2388	927	11	10	186	1793.1
2389	837	11	11	187	1796.5
2390	1088	11	6	188	1799.2
2391	1007	11	10	189	1804.9
2392	985	11	2	190	1807.2
2393	854	11	3	191	1808.2
2394	1089	11	6	192	1809.5
2395	860	11	8	193	1810.6
2396	1090	11	3	194	1813.7
2397	943	11	7	195	1821.9
2398	1091	11	5	196	1824.5
2399	1092	11	8	197	1826
2400	1002	11	9	198	1829.2
2401	911	11	6	199	1830.5
2402	1017	11	3	200	1831
2403	857	11	4	201	1833.9
2404	1093	11	7	202	1834.5
2405	1094	11	8	203	1835.6
2406	936	11	7	204	1836.7
2407	1095	11	4	205	1841.6
2408	1024	11	6	206	1852
2409	1010	11	7	207	1875
2410	1096	11	10	208	1883.2
2411	1097	11	8	209	1883.7
2412	1098	11	9	210	1888.3
2413	1099	11	10	211	1890.2
2414	1011	11	6	212	1892
2415	1100	11	4	213	1912.3
2416	1101	11	4	214	1913.1
2417	1102	11	8	215	1920.9
2418	935	11	6	216	1970.6
2419	1103	11	5	217	1997.8
2420	1104	11	8	218	2025.3
2421	1105	11	10	219	2214.6
2422	908	11	1	\N	\N
\.


--
-- Data for Name: meets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meets (id, name, year, location) FROM stdin;
1	MIAC Championships	2009	Como Park Golf Course, St. Paul
2	MIAC Championships	2010	Como Park Golf Course, St. Paul
3	MIAC Championships	2011	Como Park Golf Course, St. Paul
4	MIAC Championships	2012	Como Park Golf Course, St. Paul
5	MIAC Championships	2013	Como Park Golf Course, St. Paul
6	MIAC Championships	2014	Como Park Golf Course, St. Paul
7	MIAC Championships	2015	Como Park Golf Course, St. Paul
8	MIAC Championships	2016	Como Park Golf Course, St. Paul
9	MIAC Championships	2017	St. Olaf College, Northfield
10	MIAC Championships	2018	St. Olaf College, Northfield
11	MIAC Championships	2019	Carleton College, Northfield
\.


--
-- Data for Name: team_performances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.team_performances (id, place, points, team_id, meet_id) FROM stdin;
1	6	167	1	1
2	3	82	2	1
3	2	66	3	1
4	8	207	4	1
5	1	61	5	1
6	5	101	6	1
7	7	177	7	1
8	11	348	8	1
9	9	208	9	1
10	4	97	10	1
11	10	277	11	1
12	6	167	1	2
13	4	141	2	2
14	2	79	3	2
15	8	213	4	2
16	1	31	5	2
17	3	96	6	2
18	5	145	7	2
19	7	198	8	2
20	11	260	9	2
21	10	231	10	2
22	9	228	11	2
23	6	163	1	3
24	5	150	2	3
25	2	54	3	3
26	8	211	4	3
27	1	45	5	3
28	3	111	6	3
29	4	118	7	3
30	10	227	8	3
31	9	220	9	3
32	11	260	10	3
33	7	185	11	3
34	6	139	1	4
35	2	97	2	4
36	1	54	3	4
37	10	252	4	4
38	5	133	5	4
39	4	103	6	4
40	3	101	7	4
41	9	248	8	4
42	8	242	9	4
43	11	252	10	4
44	7	146	11	4
45	2	81	1	5
46	3	104	2	5
47	1	20	3	5
48	7	207	4	5
49	5	175	5	5
50	4	108	6	5
51	10	243	7	5
52	8	226	8	5
53	6	184	9	5
54	11	274	10	5
55	9	239	11	5
56	2	72	1	6
57	3	105	2	6
58	1	16	3	6
59	6	155	4	6
60	5	132	5	6
61	4	120	6	6
62	10	279	7	6
63	11	292	8	6
64	8	201	9	6
65	9	225	10	6
66	7	191	11	6
67	3	99	1	7
68	4	107	2	7
69	1	34	3	7
70	5	109	4	7
71	7	194	5	7
72	2	96	6	7
73	6	160	7	7
74	11	329	8	7
75	9	228	9	7
76	10	255	10	7
77	8	214	11	7
78	5	140	1	8
79	4	111	2	8
80	1	44	3	8
81	3	77	4	8
82	6	157	5	8
83	2	66	6	8
84	8	217	7	8
85	11	305	8	8
86	9	228	9	8
87	10	271	10	8
88	7	204	11	8
89	1	26	1	9
90	2	137	2	9
91	4	46	3	9
92	8	175	4	9
93	6	166	5	9
94	3	109	6	9
95	5	156	7	9
96	9	240	8	9
97	7	173	9	9
98	11	353	10	9
99	10	255	11	9
100	1	33	1	10
101	3	66	2	10
102	2	43	3	10
103	6	186	4	10
104	9	241	5	10
105	5	130	6	10
106	4	120	7	10
107	7	200	8	10
108	8	206	9	10
109	11	315	10	10
110	10	308	11	10
111	1	50	1	11
112	2	63	2	11
113	3	69	3	11
114	4	109	4	11
115	5	140	5	11
116	6	143	6	11
117	7	177	7	11
118	8	206	8	11
119	9	251	9	11
120	10	319	10	11
121	11	334	11	11
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teams (id, name, location) FROM stdin;
1	Carleton	Northfield, MN
2	St. Thomas	St. Paul, MN
3	St. Olaf	Northfield, MN
4	Gustavus Adolphus	St. Peter, MN
5	Hamline	St. Paul, MN
6	Saint John's	St. Joseph, MN
7	Bethel	St. Paul, MN
8	Concordia-Moorhead	Moorhead, MN
9	Macalester	St. Paul, MN
10	Augsburg	Minneapolis, MN
11	Saint Mary's	Winona, MN
\.


--
-- PostgreSQL database dump complete
--

