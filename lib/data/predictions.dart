List<String> listPredictions = [
  "Удача придет откуда не ждете.",
  "Давние долги будут возвращены вам.",
  "Вас ожидает неожиданное денежное поступление.",
  "Все неоконченные дела будут завершены.",
  "Яркое приключение уже поджидает вас.",
  "Если проявите внимательность, то разглядите большую любовь совсем близко от себя.",
  "Вы найдете то, что ищете.",
  "Вас ждут замечательные потери: утрата вредных заблуждений, вредных людей и вредных привычек.",
  "Однажды в вашей жизни появится имя, которое превратит в пыль имя предыдущее.",
  "Вам удастся избежать потерь в важном деле.",
  "Наступает удачное время, чтобы получить друга на все времена. Оглядитесь по сторонам.",
  "Жизнь пополнится ещё одной радостью.",
  "В жизни вам удастся встретить много доброты.",
  "Кто-то защитит вас от темных сил.",
  "Получите хорошую новость.",
  "Над вашей головой будет только мирное небо.",
  "Вы обязательно достигнете выбранной цели, если будете верны ей.",
  "Вас ждет встреча с чьим-то отзывчивым сердцем.",
  "Раздражающая бытовая неисправность в квартире будет устранена.",
  "Недруги не смогут принести вам существенного ущерба, если вы проявите немного проницательности.",
  "Будете не только выслушаны, но и услышаны.",
  "Сможете разглядеть новые возможности для роста, если присмотритесь к текущей ситуации под другим углом.",
  "Появится удобный случай расширить свои взгляды на мир.",
  "Узнаете что-то новое об окружающих вас людях.",
  "Раскройте шире глаза – сможете увидеть ещё больше красивого.",
  "Вдохновение, наконец-то, снизойдет на вас.",
  "Интуиция на этот раз не подведет вас. Используйте это.",
  "Прислушайтесь к себе и ответ на вопрос будет найден.",
  "Появится возможность отправиться в дорогу.",
  "Ваш ценный опыт сможет кому-то помочь, если перестанете его прятать в себе.",
  "Чей-то драгоценный опыт сослужит вам хорошую службу.",
  "Судьба будет добра к вам.",
  "Сможете вовремя войти в нужные двери.",
  "Вера в успех поможет обрести силы.",
  "Вам не удастся понравиться абсолютно всем, не тратьте на это энергию.",
  "Шанс на победу появится, когда будет точно определена цель.",
  "Полученный результат может превзойти ваши ожидания.",
  "Накопленное недовольство вылечится любовью и временем.",
  "Нужные плоды обязательно созреют, но сначала надо посадить зерно и набраться терпения.",
  "Слова, которые вы ждете, будут сказаны.",
  "Через некоторое время тревога пройдет, потерпите.",
  "Станете желанным гостем.",
  "Рано или поздно вы обретете стабильность.",
  "Вы осилите весь выбранный путь, если регулярно станете делать шаги вперед.",
  "Ваш разум поможет вам взять под контроль инстинкты.",
  "Хорошая книга поможет вам понять много нового.",
  "Если решитесь на незапланированное путешествие, то сможете получить множество новых ощущений.",
  "Приобретете новый ценный навык.",
  "Вас настигнет восхищенный взгляд.",
  "Встреча с нужным человеком вам обеспечена.",
  "После ночи обязательно наступит рассвет.",
  "Новые ощущения незамедлительно придут к вам, если станете вести привычную жизнь непривычным способом.",
  "Подсказки судьбы помогут избежать ошибки.",
  "Разочарования принесут только слишком завышенные ожидания. Трезво оцените свои запросы.",
  "Продуманные действия помогут рационально израсходовать силы.",
  "Сейчас то самое время, когда забота о здоровье значительно улучшит общее самочувствие.",
  "Вы окажетесь правы в своих суждениях.",
  "Наступает время честно ответить себе на некоторые вопросы.",
  "В ближайшие дни наступит удачный момент для того, чтобы стать к себе более снисходительным.",
  "Одежда, которая вас старит, не достанется вам.",
  "У людей, к которым вы придете в гости, найдутся угощения для вас.",
  "Скоро вы встретите человека, который благодарен вам за что-то.",
  "Вы встретите человека, которого есть за что благодарить.",
  "Планирование времени поможет вам не опоздать на встречу.",
  "Ваш труд будет плодотворным.",
  "Новые замыслы откроют вам новые перспективы, фантазируйте без ограничений.",
  "Вам поступит новое предложение.",
  "Вам удастся не стать слугой чужих желаний.",
  "Пришло время слушать каждого, это поможет обрести новые идеи.",
  "Ваша походка ещё долго будет оставаться легкой.",
  "Головная боль не продлится долго.",
  "Исчезнут все причины, по которым вы пропускали утреннюю зарядку.",
  "Появится шанс посмотреть на себя под другим углом.",
  "Жизнелюбие не покинет вас.",
  "Кто-то поделиться с вами позитивом.",
  "Домашний романтический вечер подарит вам приятные минуты. Купите свечи.",
  "Ваш мир будет в полной безопасности.",
  "Вам представится шанс создать нечто бессмертное.",
  "У вас появятся силы забыть сделанное добро, и не ждать благодарности. Воспользуйтесь ими по назначению.",
  "Любознательность поможет вам получить новый интеллектуальный экстаз.",
  "Вам предстоит рассмотреть неожиданное предложение.",
  "Быстрые результаты будут не в этот раз.",
  "Все желания сбудутся.",
  "Каждый новый кризис принесет с собой новые возможности.",
  "Вы сможете найти в себе что-то, что пора усовершенствовать.",
  "Вас ожидают приятные хлопоты.",
  "Рутина перестанет раздражать вас.",
  "Счастье станет для вас привычным состоянием.",
  "Приятные сны начнут приходить регулярно.",
  "Появится возможность приобрести желаемое по наиболее низкой цене.",
  "В вашем окружении появятся люди, способные вовремя прикусить язык.",
  "В вашей копилке красивых воспоминаний появятся новые.",
  "Получите звонок от того, кто соскучился по вам.",
  "Вам встретится человек, которого впоследствии вы назовете серьезной удачей в жизни.",
  "Вам удастся насладиться солнцем и не обгореть.",
  "Вам представится возможность выразить слова благодарности и любви.",
  "Все красивое уйдет из вашей жизни и останется только – прекрасное.",
  "Со временем вы поймете, что деньги – лишь символ независимости, но не счастья.",
  "Жизнь устроит всё наилучшим образом, куда бы вы не шли.",
  "Недалек тот день, когда вы будете удовлетворены собой и всем, что вас окружает.",
  "Вы сможете добраться туда куда нужно, даже если свернете не туда.",
  "Подводя итоги прожитого года, у вас будут причины гордиться собой.",
  "Вы обретете тотальную власть над своим отношением к окружающему миру.",
  "Ваша мудрость достигнет такой вершины, когда вы не станете ни о чем сожалеть.",
  "Настроение будет отличным, даже если на это не будет причин.",
  "До конца дней мир не перестанет вас удивлять.",
  "Появится повод стильно и ярко выглядеть.",
  "Вы обретете точку опоры, если будете её искать внутри себя.",
  "Все нужное придет в нужный момент и у вас будет возможность в этом убедиться.",
  "Появится возможность полюбить того, кто этого действительно достоин.",
  "Ваша награда найдет вас.",
  "На своем жизненном пути вы встретите примеры щедрости как душевной, так и материальной.",
  "Ваши ошибки сделают вас сильнее, умнее и хитрее.",
  "Приобретенный опыт подскажет как достигнуть новых успехов.",
  "Причины живущие внутри вас породят прекрасные последствия снаружи.",
  "Свежие мысли придут в голову, стоит только немного отдохнуть.",
  "Ненужные люди обязательно вас покинут.",
  "Отличное самочувствие не покинет вас.",
  "Ваш ангел-хранитель будет заботиться о вас вечно.",
  "В ближайшее время вы сумеете извлечь пользу из ситуации.",
  "Ваши дела расскажут о вас лучше, чем вы сами.",
  "Все запланированное успеете сделать в срок.",
  "Вы сможете освоить науку талантливого распоряжения своим временем, если уделите этому внимание.",
  "Рядом появится человек, которому можно без стеснения рассказывать свои сны.",
  "Сможете съесть всё что вам хочется, сколько захочется и не думать о лишнем весе.",
  "Душа и разум начнут жить в мире и согласии.",
  "Вы получите совет, который действительно нужен вам.",
  "Шанс поломать свою жизнь достанется не вам, а вашим врагам.",
  "Вы сумеете найти свой путь самостоятельно, не следуя чужому примеру.",
  "Ваша вторая половинка будет снисходительна к вашим недостаткам.",
  "Не торопите события, скоро придет весна и цветы распустятся сами.",
  "Встречающиеся на пути кочки будут подбрасывать вас только вверх.",
  "Вам представится возможность вложить душу в каждое, сделанное вами дело.",
  "Вкус к жизни будет жить в вас всегда.",
  "Не будет плодов там, где вы их не сеяли… не тратьте время на ожидание.",
  "За высокое качество придется заплатить.",
  "Потеряете друзей, если начнете искать в них изъяны.",
  "Чья-то искренняя улыбка пошлет вам радостную энергию.",
  "Не успехи, а проблемы могут показать чего вы стоите… используйте их в свою пользу.",
  "Те, кто вам друг, будут ценить и уважать вашу индивидуальность.",
  "В вашей семье родится новая семейная традиция.",
  "Вам некуда будет отступить на пути к мечте и тогда она сбудется.",
  "Родные проявят к вам особую заботу.",
  "Ваша проницательность станет способна проникнуть в непроницаемое… убедитесь сначала, что вы точно хотите туда проникнуть.",
  "Вам предстоит игнорировать провокацию.",
  "Когда увидите людей, ломающих комедию в вашем присутствии, помните – они просто хотят развеселить вас.",
  "Кому-то потребуются ваши такт и чуткость, чтобы выслушать правду.",
  "В вашей жизни случится много мгновений, которые вы будете вспоминать с теплотой и благодарностью.",
  "Удача станет верной спутницей.",
  "Жизнь преподнесет немало приятных сюрпризов.",
  "Ближайший отпуск будет непохожим на предыдущие и запомнится надолго.",
  "В конце концов вы научитесь не сжигать за собой мосты, выйдя из себя.",
  "Подводя итоги вы сможете забыть все худшее.",
  "Дорога под названием «потом» приведет в страну под названием «никуда». Смените дорогу.",
  "Короткая разлука покажет, какие из людей дороги по-настоящему.",
  "Вам не стать идеальным и это – здорово… есть куда стремиться.",
  "Чуточку трезвомыслия, капельку толерантности, немного юмора… и можно очень уютно устроиться на этой планете.",
  "Вы не перестанете мечтать и это поможет постоянно отыскивать новый смысл жизни.",
  "Самое главное в своей жизни вы увидите без помощи глаз.",
  "Хотите вы этого или нет, но окружающие всегда что-нибудь подумают… нервничать нет смысла.",
  "Если полюбите розу, вам придется терпеть и её шипы.",
  "Если приложите усилия, то правду сможете узнать за минуту… и потратить жизнь, чтобы забыть её. Может не стоит?",
  "Вам придется быть открытым для многих, если хотите впустить в свою жизнь кого-то одного очень нужного.",
  "Счастья у вас не станет меньше, если вы им с кем-то поделитесь.",
  "Прошлое вам уже не удастся изменить, но сможете подправить будущее.",
  "Время расставит всё на свои места и станет понятно, зачем всё было нужно.",
  "Вам будут посланы люди, чтобы глядя на них вы не сделали тех же ошибок.",
  "Чтобы не падать после высокого взлета, вам потребуется научиться аккуратно приземляться… чтобы затем снова взлететь.",
  "Вам повезет находиться с теми людьми, рядом с которыми сердце не ищет других.",
  "Вы не сможете увидеть новые берега, пока не отплывете от старых.",
  "Вам представится случай общаться с тем, кто лучше вас, умнее и сильнее… не упустите же возможность познать новое.",
  "Судьба подкинет дилемму… предстоит выбирать между «быть правым» и «быть любимым».",
  "Настойчивое стремление к чему-либо поможет продвинуться дальше.",
  "Не беспокойтесь, вы не останетесь без света, если станете озарять жизни других.",
  "Жизнь когда-нибудь закончится, и это – весомый аргумент, чтобы поменьше работать и побольше тратить время на любимых.",
  "Вы получите самое ценное тогда, когда будете готовы, а не тогда, когда захотите.",
  "Другие сделают за вас выбор, если вы вздумаете сомневаться.",
  "Даже в хмурый день вы сможете наслаждаться солнцем, если оно будет в вашей душе.",
  "Вы сможете сочетать в себе несочетаемое.",
  "Прекрасные люди дадут вам счастье, плохие люди наградят опытом, а лучшие – наградят воспоминаниями. Цените их всех.",
  "После прочтения прекрасной книги вы получите шанс открыть новую эру в своей жизни.",
  "Более половины людей, с которыми вы встретитесь завтра, жаждут сочувствия… проявите его и они поймут вас.",
  "В семье будут мир, благополучие и процветание.",
  "Ваш дом не станет для вас золотой клеткой.",
  "Злым людям не удастся сделать вас орудием их черных замыслов.",
  "У вас появится второй шанс произвести нужное впечатление.",
  "Сказочное богатство будет твоим! Это не значит, что оно – материальное.",
  "Приятные знакомства скоро порадуют.",
  "Кто-то полюбит вас не за что-то, а – несмотря ни на что.",
  "Вам не удастся достичь такой славы, спутником которой является одиночество.",
  "Сможете затмить многих, если найдете кого-то, кто объяснит вам законы популярности.",
  "В ближайшем будущем появится возможность сделать ремонт с наименьшими потерями времени и нервов.",
  "Вас посетит беспокойство, в результате которого вы обретете спокойствие и уверенность.",
  "В ближайшем будущем ваши желания не заставят вас рисковать всем, что у вас есть.",
  "Вы никогда не станете слишком старым, чтобы учиться.",
  "Интересная жизнь найдет вас, если решитесь покинуть свою зону комфорта.",
  "Вы получите то, чего никогда не имели… если станете делать то, чего никогда не делали.",
  "Вы услышите в свой адрес похвалы и комплименты.",
  "Черный кот, перебегающий дорогу, не принесет вам неприятностей.",
  "Обратите внимание на человека, который рядом с вами.",
  "Кто-то захочет открыть вам глаза на правду… вам предстоит решать, закрыть ли ему рот.",
  "Вам не достичь вершины, если вы не пожелаете подниматься в гору.",
  "Кто-то захочет вырыть вам яму… не мешайте ему. Когда закончит – сделаете себе бассейн.",
  "Вы сумеете использовать себе во благо тот талант, который имеете, даже если он не так огромен как у других.",
  "Терпение, умение молчать и чувство меры иногда помогут в жизни больше чем ум, красота и талант.",
  "Вы достигнете всех своих целей. Для этого снизьте количество лени, повысьте запас смекалки и выбросите все отговорки в помойку.",
  "Все крысы сбегут от вас, если сумеете изобразить крушение корабля.",
  "Получите ещё больше, если научитесь ценить то, что у вас уже есть.",
  "Ваш мозг научится активнее работать, если будете каждый день делать или узнавать что-то новое.",
  "Чужое мнение потеряет власть над вами.",
  "Жизнь преподнесет много встреч с самыми разными людьми.",
  "Вы узнаете множество самых разных удовольствий.",
  "Большинство ваших страхов покинут вас, остальные окажутся не настолько пугающими, как вы их себе представляли.",
  "Именно ошибки однажды приведут к успеху. Не сожалейте о них.",
  "Позитивные воспоминания будут радовать вас больше, чем материальные вещи.",
  "Вы станете сильнее физически, эмоционально и морально, если сумеете выделить время на спорт.",
  "Каждый ваш день станет приятным для вас, если найдете себе занятие от которого вы – без ума.",
  "Вы станете интереснее и научитесь взаимодействовать с разными культурами, если потратите время на путешествия.",
  "Негативные и пугающие мысли не станут реальностью, если вы не будете их культивировать.",
  "Вы не сможете изменить других людей. Зато можете научить себя уважать их уникальность и непохожесть на вас.",
  "Вы справитесь со всем. А с чем не справитесь, то сможете пережить.",
  "Благодарность сделает вас ещё счастливее. И та, которую испытываете вы и та, которую испытывают к вам.",
  "Интуиция станет вашей суперспособностью и многое сделает для вас. Слушайтесь её.",
  "Самообман не сможет ослепить вас. В этом вам поможет честность к самому себе.",
  "Вы удивитесь, сколько возможностей предложит вам жизнь, если не будете отвергать их и избавитесь от предрассудков.",
  "У вас появится возможность встретить редкого человека… с таким можно забыть себя.",
  "В конкуренции с себе подобными вы получите преимущество для того, чтобы победить… постарайтесь его не проглядеть.",
  "Если делать что-либо не только для себя, то мир будет выглядеть чуточку светлее.",
  "В вашей жизни будут люди, которые никогда не забудутся.",
  "Для кого-то вы станете совершенно незаменимы.",
  "Вы обретете свой внутренний свет и станете ориентиром для некоторых.",
  "Поймать удачу удастся без всяких усилий.",
  "Несколько человек за вашей спиной будут обсуждать ваши качества.",
  "Ваш враг вспомнит о вас, но сейчас он не опасен и слаб.",
  "Чтобы поймать удачу потребуется помощь.",
  "Дети удивят вас своей мудростью.",
  "Мелкие неприятности исчезнут быстро, не успев причинить существенного вреда.",
  "Поддержка влиятельного лица принесет вам немалые выгоды, не пропустите его.",
  "Вас захотят обмануть, но не смогут осуществить задуманное.",
  "Счастливые перемены ждут, когда вы будете готовы их встретить.",
  "Вас ожидает триумф в соперничестве, касающемся любви или дружбы.",
  "Вас ждет продвижение в делах или в карьере.",
  "Получите новость от дорогого человека.",
  "Вас настигнут хорошие новости о текущих делах.",
  "Урегулирование споров и разногласий уже близко.",
  "Вы можете позволить себе все, что угодно.",
  "Возможна приятная любовная связь, но без последствий.",
  "Задержки в осуществлении сердечных планов будут незначительны.",
  "Осложнения в семейных отношениях будут небольшими и недолгими.",
  "Новая дружба развеселит сердце, если вы позволите ей войти в вашу жизнь.",
  "Задержка в завершении дел будет недолгой.",
  "Интересное предложение может принести неожиданную прибыль.",
  "Давние дела завершатся выгодной сделкой.",
  "Рядом с дорогим человеком может появиться коварная женщина.",
  "Ангел-хранитель вмешается во все трудности, уладит разногласия и приведет к гармонии.",
  "Кто-то рядом с вами мечтает об укреплении отношений.",
  "Вам достанется строгий, но справедливый наставник.",
  "Мнимая подруга попытается завладеть вашим вниманием и оказывать влияние.",
  "Кто-то мечтает предоставить вам доказательства своей любви, симпатии или дружбы.",
  "Появится шанс получить влиятельного покровителя.",
  "Знакомая вам женщина поможет в делах.",
  "Флирт будет приятным и без осложнений.",
  "Ранее полученные новости подтвердятся из дополнительного источника (возможно письмом, сообщением, или иначе).",
  "Грядущие расходы не нанесут существенного ущерба кошельку.",
  "Беспокойство о здоровье окажется беспочвенным.",
  "Работа принесет удовлетворение в сердце.",
  "Услышанные ранее сплетни не подтвердятся.",
  "Половина ваших опасений окажется напрасными.",
  "Неожиданная встреча возродит в душе теплые воспоминания.",
  "Легкое беспокойство из-за темноволосого человека не перерастет в большую тревогу.",
  "Усталость будет вызвана перенапряжением и нервозностью, и быстро пройдет после отдыха, не приведет к болезням.",
  "Гнев, вызванный спорами не повлечет печальных последствий.",
  "Счастливый лотерейный билет не прилипнет сам к ботинку. Вы получите свой приз не этим способом.",
  "Предстоят небольшие приятные расходы связанные с износом предыдущих вещей.",
  "Грядущее недоразумение разрешится весельем.",
  "Ответственность, которую необходимо на себя принять, окажется для вас легкой.",
  "Отказ от навязываемой поездки принесет покой.",
  "Печаль минует вас и вы будете наслаждаться благополучием.",
  "Перепады настроения принесут легкую досаду окружающим, но покажут вам кто из них всерьез озабочен вашим самочувствием.",
  "Дополнительной нагрузки на работе удастся избежать.",
  "Кто-то в вашем кругу попытается манипулировать вашим мнением, но вам удастся вовремя это заметить, чтобы не стать пешкой в чужой игре.",
  "Вам предстоит оказаться перед искушением. У вас будет достаточно сил, чтобы устоять.",
  "В тупиковой ситуации выход будет там же, где и вход.",
  "Ваша бдительность сослужит вам хорошую службу и не даст завистникам разрушить ваше счастье.",
  "Ваша харизма с течением времени будет увеличиваться и станет верным помощникам в коммуникациях с людьми.",
  "Жизненная сила ослабнет под влиянием мелких неурядиц, но вернется к вам вдвойне увеличенной.",
  "Бумеранг уже летит к вашему недругу и в ближайшем будущем он получит свое сполна, без ваших усилий.",
  "Болтуны и пустомели не смогут нанести вред вашей репутации и даже поспособствуют увеличению вашей известности.",
  "Самые главные ваши секреты останутся неразглашенными, а если и получат огласку, то когда уже потеряют актуальность.",
  "Конец будет счастливым в любых случаях. Всегда. Если счастье не наступило, значит это ещё не конец.",
  "Вы будете выглядеть на столько, сколько прочитаете.",
  "Деньги помогут вам прекрасно провести время в ожидании счастья.",
  "Вы не сможете приобрести за деньги самые главные ценности. Они всегда достаются бесплатно.",
  "Упорно поработав вы не только получите вознаграждение, но и ваше мастерство выйдет на новый уровень.",
  "В доме надолго поселится достаток, если аккуратно распределять имеющиеся ресурсы.",
  "День станет волшебным благодаря чьей-то отзывчивости.",
  "Продолжительное использование социальных сетей не принесет вам здоровья.",
  "У вас появится всё необходимое для реализации задуманного.",
  "Встреча с истиной скорректирует ваши личные убеждения в лучшую сторону.",
  "Вам придется посчитаться с чужим мнением.",
  "Полученные знания перестанут лежать мертвым грузом, настанет пора ими воспользоваться.",
  "Ложные цели исчезнут из ваших планов и это принесет вам немало энергии и здоровья.",
  "Во всем что с вами произойдет будет много положительного… однако, многие «плюсы» вы разглядите только через время.",
  "За все, действительно важное, не придется платить деньгами… обычно за это платят кусочками души.",
  "Благодаря любви появится вдохновение творить что-то новое и делать деньги.",
  "Цены на бензин перестанут вас беспокоить, когда вы пересядете в «Феррари».",
  "Деньги не окажут на вас пагубного влияния… они просто покажут, кто вы на самом деле.",
  "Вам представится случай многое узнать о человеке, одолжив ему денег.",
  "Завтрашний день будет таить в себе прелесть новизны.",
  "Избежать будущего не удастся, как и прекрасных моментов в нем.",
  "Даже если вы не всё сделаете точно по расписанию, ваша цель от вас не уйдет.",
  "Ваши творческие успехи будут замечены и оценены по достоинству.",
  "Прагматический интерес может перерасти в романтическое увлечение.",
  "Вас ждут необычные и таинственные вечера, будьте готовы получить новые эмоции.",
  "Вы захотите, как и все избегать трудностей, но помните: самые крепкие дубы выросли на сильном ветру, а алмазы родятся под высоким давлением.",
  "Никто не сможет назвать вас занудой, если вы будете молчать.",
  "Вас никто не сочтет мрачным человеком, если вы будете улыбаться.",
  "Если в тарелке попадется инородное тело, это – на счастье.",
  "Если споткнетесь по дороге домой, это – к успеху.",
  "Если долго не находите ключей в сумке, это – к необычным и будоражащим ощущениям.",
  "Вы будете в более выигрышном положении, чем многие.",
  "Подарки, полученные в этом году, будут радовать вас не один год.",
  "Ваше обаяние и природное чутье помогут выйти из неприятной ситуации без потерь.",
  "Ваш авторитет будет стабильно расти.",
  "Репутация, заслуженная в прошлом, будет работать на вас.",
  "Важные перемены в личной жизни других, коснутся и вас.",
  "Вы обретете единомышленников, если станете чуть более открытым.",
  "Изменение внешнее и внутреннее преобразит вас, отражение в зеркале – удивит.",
  "Ваши лидерские качества неоднократно пройдут испытания и проверку на прочность.",
  "Ум станет более важным вашим активом, нежели ваша внешность.",
  "Ваше терпение будет вознаграждено.",
  "Принятые вами защитные меры помогут предотвратить личные катастрофы.",
  "Вам представится случай сменить работу на более интересную.",
  "Новый год принесет новые перспективы.",
  "Успех не сможет испортить вас, если вы всегда будете невыносимы.",
  "Старость не будет пугать вас и угнетать, если вы рассмотрите альтернативу.",
  "Самое увлекательное времяпровождение ждет вас в будущем.",
  "Беспокоиться не о чем! Успех не наступит раньше, чем вы сможете выдержать его.",
  "Перемены принесут в жизнь прогресс, не страшитесь их.",
  "Рекламой ваших возможностей станут плоды вашего труда.",
  "Воображение подарит вам крылья, если вы не поленитесь включить его.",
  "Нажитый опыт станет тем сокровищем, которое следует с вами повсюду и которое невозможно отнять или потерять.",
  "Чем больше вы будете требовать от себя, тем больше вас будут уважать другие.",
  "Любопытство убьет скуку. Не убивайте в себе любопытство.",
  "Изменения, которые внесете в себя, будут иметь далеко идущие последствия.",
  "Ничего не получится только у того, кто ничего не делает.",
  "Вы сможете предсказывать будущее, если начнете сами изобретать его.",
  "Появится шанс стать хозяином ситуации. Во что она превратится – зависит от ваших решений.",
  "Вам удастся выявить чью-то неискренность.",
  "Полученное превысит ваши ожидания.",
  "В ближайшее время Фортуна придет на вашу орбиту, используйте её.",
  "Вы сможете насладиться уединением.",
  "Жизнь бросит вам вызов в недалеком будущем… используйте такой шанс показать себе чего вы стоите.",
  "В конце пути ваша жизнь поклонится вам за то, что вы ее прожили.",
  "Что-то, оставленное в прошлом, приобретет актуальность в настоящем.",
  "Прилив созидательных сил наполнит вас и поможет реализовать давно запланированное.",
  "Вам будет доверено нечто, что требует ответственного отношения.",
  "Неясная ситуация скоро прояснится. Вам следует держать глаза открытыми и не придумывать то, чего нет.",
  "Ситуация потребует от вас смирения. Оно впоследствии окупится сторицей.",
  "Благодаря своевременным догадкам и озарениям вы получите желаемое.",
  "Скоро вы получите знания, которые прольют свет на то, что ранее было скрыто.",
  "Когда решите действовать ваши глаза закроются для сомнений.",
  "Это – просто жизнь… и это значит – ты обязательно прорвёшься.",
  "Нужные слова на все случаи жизни найдутся по адресу woman-gu.ru",
  "Делайте то, чего просит ваша душа и тело.",
  "Сделайте перерыв и наслаждайтесь своей жизнь.",
  "Встретьтесь с друзьями, это даст вдохновения, новые идеи и зарядит настроением.",
  "Прислушивайтесь не только к зову сердца, но и к разуму – так шанс на успех выше.",
  "Та часть жизни, которая была тайной, наконец, готова проявиться.",
  "Кто-то старается помешать или навредить вам.",
  "Покорив одну гору, начинай штурмовать другую…",
  "Скоро вы приобретете две новых привычки и избавитесь от одной.",
  "Присмотритесь – может, ваша истинная любовь тот, кого вы уже знаете много лет!",
  "Не отказывайтесь от своей индивидуальности в угоду другим. Вы прекрасны со всеми своими неповторимыми особенностями.",
  "Вы добьётесь любой цели четкой аргументацией и мешком конфет.",
  "Доверьтесь интуиции, она не подведет.",
  "Вас ожидают тревоги и беспокойства.",
  "Люди любят побеждать, если вы не определились с финальной целью, шансов на победу у вас нет.",
  "На ошибках учатся.",
  "Вас ждет встреча с важным человеком.",
  "Очень скоро придет важное известие.",
  "Сейчас лучшее время для новых устремлений и ярких чувств.",
  "Порадуй себя сегодня.",
  "От посева зерна до жатвы должно пройти время.",
  "Пришло время закончить старое и начать новое.",
  "Счастливые новости уже на пути к вам.",
  "Сделайте что-нибудь необычное завтра.",
  "Вы отправитесь в необычное путешествие.",
  "Вам, наконец, удастся отпереть заржавевший замок.",
  "Не сдавайтесь и вы не проиграете.",
  "Реализация задуманного превзойдет все ожидания.",
  "Вы на верном пути, вас ждет успех.",
  "Ищите счастье и вы его найдете.",
  "Все поменяется к лучшему только вслед за вами.",
  "Ваши надежды и планы сбудутся сверх ваших ожиданий.",
  "Вы попробуете себя в новой области, это полностью изменит вашу жизнь.",
  "Помните, что каждый день – первый в оставшейся жизни.",
  "Упущенный случай редко повторяется. Пробуйте!",
  "Романтика перенесет вас в новое измерение.",
  "Секрет успешного продвижения – это начало.",
  "Не ожидайте слишком многого и не думайте о конечном результате.",
  "Вы встретите кого-то особенного в ближайшее время.",
  "Вас ждут великие дела.",
  "Делайте то, что говорит вам ваше сердце.",
  "Время осушит все слезы и исцелит все раны.",
  "Никогда не говорите никогда.",
  "Мало думать, нужно еще и делать.",
  "Порадуйте себя сегодня.",
  "Делайте что должны, и будь что будет.",
  "Ничего не решать – тоже решение.",
  "Этот год принесет удачу.",
  "Ваши желания сбудутся ближайшей ночью.",
  "Доверяйте тому, что с вами происходит.",
  "Не рвитесь в герои, пока не позовут.",
  "В жизни есть главное и не главное, а мы часто тратим силы не пустяки.",
  "Лучшее – враг хорошего.",
  "Научитесь властвовать над своими мыслями, и вы будете счастливы.",
  "Вы получите ответы на свои вопросы.",
  "Вы надеетесь не напрасно.",
  "Цель определяет успех.",
  "Прошлое прошло… завтра много возможностей.",
  "Вам стоит немного подождать, и будущее принесет вам большую радость.",
  "Делитесь радостью с окружающими и сами наслаждайтесь ей.",
  "Все в наших руках, поэтому нельзя их опускать.",
  "Борьба всегда оправдана, если знаешь к чему стремишься.",
  "Счастлив тот, кто счастлив у себя дома.",
  "Будьте осторожны, кто-то хочет вас обмануть.",
  "Объятия как бумеранг, они обязательно вернутся к вам обратно.",
  "Будьте настойчивы в битве с собственным эгоизмом.",
  "Вы завоюете успех во всем.",
  "Наслаждайся всеми красками жизни.",
  "Вперед и только вперед: дело, о котором вы думаете, - правое.",
  "Если вы еще не встретили свою любовь, то в этом году обязательно встретите.",
  "Вы найдете занятие, которое сможет вас всецело вдохновить.",
  "Не позволяйте амбициям затмить даже самый маленький успех.",
  "Если вы проявите инициативу, успех не заставит себя ждать.",
  "События полностью вне вашего контроля.",
  "Цель – основная точка отсчета для инвестиций, энергии и времени.",
  "Вас ожидают перемены.",
  "Чудеса чаще случаются там, где их ждут.",
  "Вскоре вас ждет улучшение материального положения.",
  "Самое время снести старое и построить на его месте новое.",
  "Завершите то, что начали.",
  "Верьте, хорошее обязательно случится.",
  "Время гармонии в семье и с окружающим миром.",
  "Кто-то думает о вас.",
  "Один раз везет только дуракам. Умным везет всегда.",
  "Вы получите неожиданную поддержку.",
  "Раскройте и пропустите свет в ту часть своей жизни, которая до сих пор была тайной.",
  "Секрет сохранения молодости в том, чтобы избегать некрасивых эмоций.",
  "Вам доступны все дороги – выбирайте свою.",
  "Сегодня стремитесь выиграть или хотя бы не проиграть.",
  "Работа с новыми партнерами будет очень выгодна.",
  "Берегите свое здоровье, пока не столкнетесь с бедой, не поймете, насколько оно драгоценно.",
  "Забудьте о мести, удобно устраивайтесь и просто наблюдайте, как карма накажет вашего обидчика.",
  "Сегодня удачный день, чтобы завязать с вредной привычкой.",
  "Работай над дипломатическими способностями – они пригодятся для реализации идей.",
  "Сегодня хороший день для планирования будущего.",
  "Вас ждет любовь. Скоро, совсем скоро.",
  "Чем больше скрываешься, тем больше о тебе придумывают.",
  "В жизни всегда найдется место для маленьких невинных шалостей.",
  "Прочитай бумажную книгу, окунись в очарование близкого прошлого.",
  "У каждого события не одна, а несколько причин.",
  "Любые дела будут спориться – особенно, если вы заручитесь поддержкой друзей.",
  "Именно сейчас лучший момент для работы над собой. Дерзайте!",
  "Не позволяйте никому стоять на пути к вашему счастью.",
  "Планируйте поездку на море. Неважно какие обстоятельства. Просто скажи им – меня ждут морские коньки!",
  "Будьте внимательны к подсказкам судьбы.",
  "Вы узнаете, кто любовь всей вашей жизни.",
  "Есть шанс встретить любовь всей жизни в ближайшие дни. Поэтому будьте приветливы и привлекательны.",
  "Позвольте мечтам вести вас вперед.",
  "Иногда сделать первый шаг – самое трудное. Но если сделаете – дальше все пойдет как по маслу.",
  "Перестань торопиться.",
  "У собаки столько друзей потому, что она виляет хвостом, а не болтает языком.",
  "Удача переменчива, но сегодня вам удастся ухватить ее за хвост.",
  "Вы уникальны, так же, как и все остальные.",
  "Вы сильнее, чем думаете. Действуйте, и результат превзойдет самые смелые ожидания.",
  "Вы исполните свою давнюю мечту.",
  "Очень скоро придет важное известие.",
  "Время поиска гармонии в жизни."
];