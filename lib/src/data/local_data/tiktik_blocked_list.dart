// This list is used to manually add the word list
List<String> tiktokBlockedWords = [
  "đm", "đcm", "đmm", "đcc", "mẹ", "con mẹ", "con đĩ", "đĩ", "đéo", "địt",
  "vãi", "cứt", "cặc", "lồn", "chym", "buồi", "bướm", "dái", "cu", "chim",
  "thằng khốn", "đồ khốn", "con điếm", "bê đê", "pê đê", "khốn nạn", "thằng khốn nạn",
  "ngu", "đần", "đần độn", "ngu ngốc", "ngu như bò", "ngu như chó", "đần như cục",
  "chó", "heo", "lợn", "chó đẻ", "mất dạy", "bố láo", "láo toét", "vô học",
  "dốt", "dốt nát", "thằng ngu", "con ngu", "khùng", "điên", "điên khùng",
  "hâm", "dở hơi", "dại", "ngu si", "ngu đần", "thằng hâm", "thằng dở hơi",
  "ngu đần", "thằng ngu đần", "con ngu đần", "thằng mất dạy", "con mất dạy",
  "thằng mất nết", "con mất nết", "khốn", "thằng khốn", "con khốn", "đồ con khốn",
  "thằng ngu si", "con ngu si", "đần thối", "thằng đần thối", "con đần thối",
  "mù", "điếc", "câm", "thằng câm", "con câm", "thằng điếc", "con điếc",
  "mù quáng", "thằng mù", "con mù", "đồ mù", "mù tịt", "mù đặc", "đồ mù đặc",
  "thằng khốn nạn", "con khốn nạn", "đồ khốn nạn", "đĩ rạc", "thằng đĩ",
  "con đĩ", "đồ đĩ", "thằng đĩ rạc", "con đĩ rạc", "đồ đĩ rạc", "thằng lừa đảo",
  "con lừa đảo", "đồ lừa đảo", "lừa đảo", "bọn lừa đảo", "cái đồ", "cái thứ",
  "cái ngữ", "bọn ngu", "bọn dốt", "lũ ngu", "lũ dốt", "bọn chó", "lũ chó",
  "bọn lợn", "lũ lợn", "bọn heo", "lũ heo", "thằng chết tiệt", "con chết tiệt",
  "đồ chết tiệt", "chết tiệt", "thằng mất nết", "con mất nết", "đồ mất nết",
  "vô liêm sỉ", "thằng vô liêm sỉ", "con vô liêm sỉ", "đồ vô liêm sỉ",
  "không biết xấu hổ", "thằng không biết xấu hổ", "con không biết xấu hổ",
  "đồ không biết xấu hổ", "thằng khốn kiếp", "con khốn kiếp", "đồ khốn kiếp",
  "khốn kiếp", "vô học", "thằng vô học", "con vô học", "đồ vô học", "thằng điên",
  "con điên", "đồ điên", "điên rồ", "điên cuồng", "điên khùng", "đồ điên khùng",
  "thằng khùng", "con khùng", "đồ khùng", "dở hơi", "thằng dở hơi", "con dở hơi",
  "đồ dở hơi", "thằng hâm", "con hâm", "đồ hâm", "ngu ngốc", "ngu xuẩn",
  "thằng ngu ngốc", "con ngu ngốc", "đồ ngu ngốc", "ngu ngốc", "thằng ngu xuẩn",
  "con ngu xuẩn", "đồ ngu xuẩn", "ngu si", "thằng ngu si", "con ngu si",
  "đồ ngu si", "thằng câm", "con câm", "đồ câm", "câm đi", "câm mồm", "câm miệng",
  "thằng câm điếc", "con câm điếc", "đồ câm điếc", "mù lòa", "mù quáng",
  "mù tịt", "đồ mù tịt", "thằng mù tịt", "con mù tịt", "đồ mù quáng", "thằng mù quáng",
  "con mù quáng", "đồ mù lòa", "thằng mù lòa", "con mù lòa", "mù lòa", "điếc đặc",
  "đồ điếc đặc", "thằng điếc đặc", "con điếc đặc", "đồ câm điếc", "thằng câm điếc",
  "con câm điếc", "đồ dại", "thằng dại", "con dại", "dại dột", "đồ dại dột",
  "thằng dại dột", "con dại dột", "ngu dốt", "thằng ngu dốt", "con ngu dốt",
  "đồ ngu dốt", "ngu xuẩn", "đồ ngu xuẩn", "thằng ngu xuẩn", "con ngu xuẩn",
  "thằng ngu ngốc", "con ngu ngốc", "đồ ngu ngốc", "ngu như lợn", "ngu như heo",
  "thằng ngu như lợn", "con ngu như lợn", "đồ ngu như lợn", "thằng ngu như heo",
  "con ngu như heo", "đồ ngu như heo", "ngu si", "đồ ngu si", "thằng ngu si",
  "con ngu si", "ngu xuẩn", "đồ ngu xuẩn", "thằng ngu xuẩn", "con ngu xuẩn",
  "đồ ngu", "đồ đần", "đồ khùng", "đồ điên", "đồ hâm", "đồ ngu ngốc", "đồ ngu si",
  "đồ ngu xuẩn", "đồ mù", "đồ điếc", "đồ câm", "đồ mù lòa", "đồ mù tịt", "đồ mù quáng",
  "đồ điếc đặc", "đồ câm điếc", "đồ dại", "đồ dại dột", "đồ dốt", "đồ dốt nát",
  "đồ mất dạy", "đồ mất nết", "đồ khốn nạn", "đồ khốn kiếp", "đồ vô học",
  "đồ vô liêm sỉ", "đồ không biết xấu hổ", "đồ lừa đảo", "đồ đĩ", "đồ đĩ rạc",
  "đồ chó", "đồ lợn", "đồ heo", "đồ khốn", "đồ khốn kiếp", "đồ khốn nạn",
  "đồ khốn", "đồ hèn", "đồ hèn nhát", "đồ hèn hạ", "đồ hèn mọn", "đồ hèn kém",
  "đồ hèn", "đồ nhát", "đồ nhát gan", "đồ nhát hít", "đồ nhát hít", "đồ nhát hít",
  "đồ hèn nhát", "đồ hèn mạt", "đồ hèn kém", "đồ nhát gan", "đồ nhát hít",
  "đồ nhát hít", "đồ nhát hít", "đồ hèn mọn", "đồ nhát gan", "đồ hèn nhát",
  "đồ hèn mọn", "đồ hèn kém", "đồ nhát gan", "đồ nhát hít", "đồ nhát hít",
  "đồ nhát hít", "đồ hèn mạt", "đồ nhát gan", "đồ hèn nhát", "đồ hèn mọn",
  "đồ hèn","đm", "đcm", "đmm", "đcc", "mẹ", "con mẹ", "con đĩ", "đĩ", "đéo", "địt",
  "vãi", "cứt", "cặc", "lồn", "chym", "buồi", "bướm", "dái", "cu", "chim",
  "thằng khốn", "đồ khốn", "con điếm", "bê đê", "pê đê", "khốn nạn", "thằng khốn nạn",
  "ngu", "đần", "đần độn", "ngu ngốc", "ngu như bò", "ngu như chó", "đần như cục",
  "chó", "heo", "lợn", "chó đẻ", "mất dạy", "bố láo", "láo toét", "vô học",
  "dốt", "dốt nát", "thằng ngu", "con ngu", "khùng", "điên", "điên khùng",
  "hâm", "dở hơi", "dại", "ngu si", "ngu đần", "thằng hâm", "thằng dở hơi",
  "ngu đần", "thằng ngu đần", "con ngu đần", "thằng mất dạy", "con mất dạy",
  "thằng mất nết", "con mất nết", "khốn", "thằng khốn", "con khốn", "đồ con khốn",
  "thằng ngu si", "con ngu si", "đần thối", "thằng đần thối", "con đần thối",
  "mù", "điếc", "câm", "thằng câm", "con câm", "thằng điếc", "con điếc",
  "mù quáng", "thằng mù", "con mù", "đồ mù", "mù tịt", "mù đặc", "đồ mù đặc",
  "thằng khốn nạn", "con khốn nạn", "đồ khốn nạn", "đĩ rạc", "thằng đĩ",
  "con đĩ", "đồ đĩ", "thằng đĩ rạc", "con đĩ rạc", "đồ đĩ rạc", "thằng lừa đảo",
  "con lừa đảo", "đồ lừa đảo", "lừa đảo", "bọn lừa đảo", "cái đồ", "cái thứ",
  "cái ngữ", "bọn ngu", "bọn dốt", "lũ ngu", "lũ dốt", "bọn chó", "lũ chó",
  "bọn lợn", "lũ lợn", "bọn heo", "lũ heo", "thằng chết tiệt", "con chết tiệt",
  "đồ chết tiệt", "chết tiệt", "thằng mất nết", "con mất nết", "đồ mất nết",
  "vô liêm sỉ", "thằng vô liêm sỉ", "con vô liêm sỉ", "đồ vô liêm sỉ",
  "không biết xấu hổ", "thằng không biết xấu hổ", "con không biết xấu hổ",
  "đồ không biết xấu hổ", "thằng khốn kiếp", "con khốn kiếp", "đồ khốn kiếp",
  "khốn kiếp", "vô học", "thằng vô học", "con vô học", "đồ vô học", "thằng điên",
  "con điên", "đồ điên", "điên rồ", "điên cuồng", "điên khùng", "đồ điên khùng",
  "thằng khùng", "con khùng", "đồ khùng", "dở hơi", "thằng dở hơi", "con dở hơi",
  "đồ dở hơi", "thằng hâm", "con hâm", "đồ hâm", "ngu ngốc", "ngu xuẩn",
  "thằng ngu ngốc", "con ngu ngốc", "đồ ngu ngốc", "ngu ngốc", "thằng ngu xuẩn",
  "con ngu xuẩn", "đồ ngu xuẩn", "ngu si", "thằng ngu si", "con ngu si",
  "đồ ngu si", "thằng câm", "con câm", "đồ câm", "câm đi", "câm mồm", "câm miệng",
  "thằng câm điếc", "con câm điếc", "đồ câm điếc", "mù lòa", "mù quáng",
  "mù tịt", "đồ mù tịt", "thằng mù tịt", "con mù tịt", "đồ mù quáng", "thằng mù quáng",
  "con mù quáng", "đồ mù lòa", "thằng mù lòa", "con mù lòa", "mù lòa", "điếc đặc",
  "đồ điếc đặc", "thằng điếc đặc", "con điếc đặc", "đồ câm điếc", "thằng câm điếc",
  "con câm điếc", "đồ dại", "thằng dại", "con dại", "dại dột", "đồ dại dột",
  "thằng dại dột", "con dại dột", "ngu dốt", "thằng ngu dốt", "con ngu dốt",
  "đồ ngu dốt", "ngu xuẩn", "đồ ngu xuẩn", "thằng ngu xuẩn", "con ngu xuẩn",
  "thằng ngu ngốc", "con ngu ngốc", "đồ ngu ngốc", "ngu như lợn", "ngu như heo",
  "thằng ngu như lợn", "con ngu như lợn", "đồ ngu như lợn", "thằng ngu như heo",
  "con ngu như heo", "đồ ngu như heo", "ngu si", "đồ ngu si", "thằng ngu si",
  "con ngu si", "ngu xuẩn", "đồ ngu xuẩn", "thằng ngu xuẩn", "con ngu xuẩn",
  "đồ ngu", "đồ đần", "đồ khùng", "đồ điên", "đồ hâm", "đồ ngu ngốc", "đồ ngu si",
  "đồ ngu xuẩn", "đồ mù", "đồ điếc", "đồ câm", "đồ mù lòa", "đồ mù tịt", "đồ mù quáng",
  "đồ điếc đặc", "đồ câm điếc", "đồ dại", "đồ dại dột", "đồ dốt", "đồ dốt nát",
  "đồ mất dạy", "đồ mất nết", "đồ khốn nạn", "đồ khốn kiếp", "đồ vô học",
  "đồ vô liêm sỉ", "đồ không biết xấu hổ", "đồ lừa đảo", "đồ đĩ", "đồ đĩ rạc",
  "đồ chó", "đồ lợn", "đồ heo", "đồ khốn", "đồ khốn kiếp", "đồ khốn nạn",
  "đồ khốn", "đồ hèn", "đồ hèn nhát", "đồ hèn hạ", "đồ hèn mọn", "đồ hèn kém",
  "đồ hèn", "đồ nhát", "đồ nhát gan", "đồ nhát hít", "đồ nhát hít", "đồ nhát hít",
  "đồ hèn nhát", "đồ hèn mạt", "đồ hèn kém", "đồ nhát gan", "đồ nhát hít",
  "đồ nhát hít", "đồ nhát hít", "đồ hèn mọn", "đồ nhát gan", "đồ hèn nhát",
  "đồ hèn mọn", "đồ hèn kém", "đồ nhát gan", "đồ nhát hít", "đồ nhát hít",
  "đồ nhát hít", "đồ hèn mạt", "đồ nhát gan", "đồ hèn nhát", "đồ hèn mọn",
  "đồ hèn tiếp","đm", "đcm", "đmm", "đcc", "mẹ", "con mẹ", "con đĩ", "đĩ", "đéo", "địt",
  "vãi", "cứt", "cặc", "lồn", "chym", "buồi", "bướm", "dái", "cu", "chim",
  "thằng khốn", "đồ khốn", "con điếm", "bê đê", "pê đê", "khốn nạn", "thằng khốn nạn",
  "ngu", "đần", "đần độn", "ngu ngốc", "ngu như bò", "ngu như chó", "đần như cục",
  "chó", "heo", "lợn", "chó đẻ", "mất dạy", "bố láo", "láo toét", "vô học",
  "dốt", "dốt nát", "thằng ngu", "con ngu", "khùng", "điên", "điên khùng",
  "hâm", "dở hơi", "dại", "ngu si", "ngu đần", "thằng hâm", "thằng dở hơi",
  "ngu đần", "thằng ngu đần", "con ngu đần", "thằng mất dạy", "con mất dạy",
  "thằng mất nết", "con mất nết", "khốn", "thằng khốn", "con khốn", "đồ con khốn",
  "thằng ngu si", "con ngu si", "đần thối", "thằng đần thối", "con đần thối",
  "mù", "điếc", "câm", "thằng câm", "con câm", "thằng điếc", "con điếc",
  "mù quáng", "thằng mù", "con mù", "đồ mù", "mù tịt", "mù đặc", "đồ mù đặc",
  "thằng khốn nạn", "con khốn nạn", "đồ khốn nạn", "đĩ rạc", "thằng đĩ",
  "con đĩ", "đồ đĩ", "thằng đĩ rạc", "con đĩ rạc", "đồ đĩ rạc", "thằng lừa đảo",
  "con lừa đảo", "đồ lừa đảo", "lừa đảo", "bọn lừa đảo", "cái đồ", "cái thứ",
  "cái ngữ", "bọn ngu", "bọn dốt", "lũ ngu", "lũ dốt", "bọn chó", "lũ chó",
  "bọn lợn", "lũ lợn", "bọn heo", "lũ heo", "thằng chết tiệt", "con chết tiệt",
  "đồ chết tiệt", "chết tiệt", "thằng mất nết", "con mất nết", "đồ mất nết",
  "vô liêm sỉ", "thằng vô liêm sỉ", "con vô liêm sỉ", "đồ vô liêm sỉ",
  "không biết xấu hổ", "thằng không biết xấu hổ", "con không biết xấu hổ",
  "đồ không biết xấu hổ", "thằng khốn kiếp", "con khốn kiếp", "đồ khốn kiếp",
  "khốn kiếp", "vô học", "thằng vô học", "con vô học", "đồ vô học", "thằng điên",
  "con điên", "đồ điên", "điên rồ", "điên cuồng", "điên khùng", "đồ điên khùng",
  "thằng khùng", "con khùng", "đồ khùng", "dở hơi", "thằng dở hơi", "con dở hơi",
  "đồ dở hơi", "thằng hâm", "con hâm", "đồ hâm", "ngu ngốc", "ngu xuẩn",
  "thằng ngu ngốc", "con ngu ngốc", "đồ ngu ngốc", "ngu ngốc", "thằng ngu xuẩn",
  "con ngu xuẩn", "đồ ngu xuẩn", "ngu si", "thằng ngu si", "con ngu si",
  "đồ ngu si", "thằng câm", "con câm", "đồ câm", "câm đi", "câm mồm", "câm miệng",
  "thằng câm điếc", "con câm điếc", "đồ câm điếc", "mù lòa", "mù quáng",
  "mù tịt", "đồ mù tịt", "thằng mù tịt", "con mù tịt", "đồ mù quáng", "thằng mù quáng",
  "con mù quáng", "đồ mù lòa", "thằng mù lòa", "con mù lòa", "mù lòa", "điếc đặc",
  "đồ điếc đặc", "thằng điếc đặc", "con điếc đặc", "đồ câm điếc", "thằng câm điếc",
  "con câm điếc", "đồ dại", "thằng dại", "con dại", "dại dột", "đồ dại dột",
  "thằng dại dột", "con dại dột", "ngu dốt", "thằng ngu dốt", "con ngu dốt",
  "đồ ngu dốt", "ngu xuẩn", "đồ ngu xuẩn", "thằng ngu xuẩn", "con ngu xuẩn",
  "thằng ngu ngốc", "con ngu ngốc", "đồ ngu ngốc", "ngu như lợn", "ngu như heo",
  "thằng ngu như lợn", "con ngu như lợn", "đồ ngu như lợn", "thằng ngu như heo",
  "con ngu như heo", "đồ ngu như heo", "ngu si", "đồ ngu si", "thằng ngu si",
  "con ngu si", "ngu xuẩn", "đồ ngu xuẩn", "thằng ngu xuẩn", "con ngu xuẩn",
  "đồ ngu", "đồ đần", "đồ khùng", "đồ điên", "đồ hâm", "đồ ngu ngốc", "đồ ngu si",
  "đồ ngu xuẩn", "đồ mù", "đồ điếc", "đồ câm", "đồ mù lòa", "đồ mù tịt", "đồ mù quáng",
  "đồ điếc đặc", "đồ câm điếc", "đồ dại", "đồ dại dột", "đồ dốt", "đồ dốt nát",
  "đồ mất dạy", "đồ mất nết", "đồ khốn nạn", "đồ khốn kiếp", "đồ vô học",
  "đồ vô liêm sỉ", "đồ không biết xấu hổ", "đồ lừa đảo", "đồ đĩ", "đồ đĩ rạc",
  "đồ chó", "đồ lợn", "đồ heo", "đồ khốn", "đồ khốn kiếp", "đồ khốn nạn",
  "đồ khốn", "đồ hèn", "đồ hèn nhát", "đồ hèn hạ", "đồ hèn mọn", "đồ hèn kém",
  "đồ hèn", "đồ nhát", "đồ nhát gan", "đồ nhát hít", "đồ nhát hít", "đồ nhát hít",
  "đồ hèn nhát", "đồ hèn mạt", "đồ hèn kém", "đồ nhát gan", "đồ nhát hít",
  "đồ nhát hít", "đồ nhát hít", "đồ hèn mọn", "đồ nhát gan", "đồ hèn nhát",
  "đồ hèn mọn", "đồ hèn kém", "đồ nhát gan", "đồ nhát hít", "đồ nhát hít",
  "đồ nhát hít", "đồ hèn mạt", "đồ nhát gan", "đồ hèn nhát", "đồ hèn mọn",
  "đồ hèn tiếp",
  "ngu ngốc", "ngu dốt", "ngu si đần độn", "ngu si đần", "ngu đần", "ngu dại",
  "ngu đần", "ngu đần độn", "ngu đần ngu xuẩn", "ngu ngốc khùng điên","phân", "đồng bóng", "phản động", "phá hoại", "phản bội", "phản trắc", "vô ơn", "bất nghĩa",
  "bất hiếu", "bất nhân", "bất tín", "thất tín", "thất hứa", "thất lễ", "hèn mạt", "hèn kém",
  "đốn mạt", "đê tiện", "hèn hạ", "mạt hạng", "cặn bã", "thối nát", "hủ bại", "bại hoại",
  "suy đồi", "tha hóa", "biến chất", "suy thoái", "tha hóa", "ti tiện", "đê hèn", "cặn bã",
  "hèn nhát", "nhát gan", "tiểu nhân", "đê hèn", "bần tiện", "keo kiệt", "ti tiện", "tiểu nhân",
  "đồ đểu", "kẻ đểu", "kẻ bần tiện", "kẻ ti tiện", "kẻ hèn nhát", "kẻ đê hèn", "đê hèn",
  "đốn mạt", "kẻ bần", "kẻ hèn", "đồ cặn", "bẩn thỉu", "ghê tởm", "kinh tởm", "hèn bần",
  "thối tha", "thối nát", "đồ cặn", "đồ đê", "đồ đểu", "đồ hèn", "đồ bần", "bần cùng",
  "cạn kiệt", "bần nông", "hèn kém", "đê hèn", "kẻ đê", "kẻ đểu", "kẻ hèn", "đồ bẩn",
  "đồ dơ", "đồ nhơ", "đồ rác", "rác rưởi", "rác rến", "đồ rác", "đồ thối", "đồ ô uế",
  "đồ dơ dáy", "dơ bẩn", "bẩn thỉu", "dơ dáy", "ô uế", "ghê tởm", "kinh tởm", "dơ dáy",
  "nhơ bẩn", "nhơ nhớp", "bẩn", "dơ", "bẩn thỉu", "dơ dáy", "ô uế", "nhơ bẩn", "kinh tởm",
  "ghê tởm", "nhơ nhớp", "đồ bẩn thỉu", "đồ dơ dáy", "đồ ô uế", "đồ nhơ bẩn", "đồ kinh tởm",
  "đồ ghê tởm", "đồ thối tha", "đồ bần tiện", "kẻ bẩn", "kẻ dơ", "kẻ bẩn thỉu", "kẻ dơ dáy",
  "kẻ ô uế", "kẻ nhơ bẩn", "kẻ kinh tởm", "kẻ ghê tởm", "kẻ thối", "kẻ nhơ nhớp", "kẻ nhơ bẩn",
  "đồ đểu cáng", "kẻ đểu cáng", "kẻ gian trá", "kẻ xảo trá", "kẻ lừa lọc", "kẻ lừa đảo",
  "kẻ gian dối", "kẻ phản bội", "kẻ lừa dối", "kẻ lừa đảo", "kẻ gian manh", "kẻ xảo quyệt",
  "kẻ lươn lẹo", "kẻ lừa gạt", "đồ lừa", "đồ bịp", "đồ gian", "đồ xảo", "đồ lừa đảo",
  "đồ lừa dối", "đồ gian trá", "đồ xảo trá", "đồ xảo quyệt", "đồ lươn lẹo", "đồ lừa gạt",
  "đồ gian manh", "đồ xảo trá", "đồ lừa đảo", "đồ lừa lọc", "đồ phản bội", "đồ phản trắc",
  "đồ thất tín", "đồ gian dối", "đồ bịp bợm", "đồ lừa đảo", "đồ gian manh", "đồ gian lận",
  "đồ gian dối", "đồ phản bội", "đồ phản trắc", "đồ bịp bợm", "đồ lừa đảo", "đồ gian lận",
  "đồ gian trá", "đồ phản bội", "đồ phản trắc", "đồ xảo trá", "đồ xảo quyệt", "đồ gian trá",
  "đồ lừa lọc", "đồ lừa dối", "đồ lừa đảo", "đồ gian dối", "đồ gian lận", "đồ phản bội",
  "đồ phản trắc", "đồ xảo quyệt", "đồ gian manh", "đồ xảo trá", "đồ lừa lọc", "đồ phản trắc",
  "đồ phản bội", "đồ gian trá", "đồ lừa đảo", "đồ gian manh", "đồ xảo quyệt", "đồ lươn lẹo",
  "đồ phản bội", "đồ gian dối", "đồ xảo quyệt", "đồ gian manh", "đồ xảo trá", "đồ gian trá",
  "đồ phản bội", "đồ lừa đảo", "đồ gian trá", "đồ lừa lọc", "đồ gian dối", "đồ gian lận",
  "đồ phản bội", "đồ phản trắc", "đồ xảo quyệt", "đồ gian trá", "đồ lừa đảo", "đồ lừa lọc",
  "đồ phản bội", "đồ gian trá", "đồ lừa đảo", "đồ xảo trá", "đồ gian dối", "đồ gian lận",
  "đồ phản bội", "đồ gian manh", "đồ lừa lọc", "đồ xảo trá", "đồ lừa đảo", "đồ phản bội",
  "đồ phản trắc", "đồ gian trá", "đồ lừa lọc", "đồ lừa đảo", "đồ xảo trá", "đồ phản bội",
  "đồ gian trá", "đồ phản trắc", "đồ phản bội", "đồ gian trá", "đồ lừa đảo", "đồ xảo quyệt",
  "đồ lừa lọc", "đồ gian manh", "đồ lừa lọc", "đồ gian trá", "đồ lừa đảo", "đồ phản bội",
  "đồ xảo trá", "đồ gian dối", "đồ gian trá", "đồ phản bội", "đồ phản trắc", "đồ xảo quyệt",
  "đồ gian manh", "đồ lừa lọc", "đồ lừa đảo", "đồ phản bội", "đồ xảo trá", "đồ lừa lọc",
  "đồ gian trá", "đồ xảo quyệt", "đồ gian manh", "đồ phản bội", "đồ gian lận", "đồ lừa lọc",
  "đồ lừa đảo", "đồ xảo trá", "đồ gian trá", "đồ phản trắc", "đồ phản bội", "đồ lừa lọc",
  "đồ lừa đảo", "đồ gian trá", "đồ xảo quyệt", "đồ gian manh", "đồ phản trắc", "đồ lừa lọc",
  "đồ phản bội", "đồ gian trá", "đồ lừa lọc", "đồ lừa đảo", "đồ phản bội", "đồ xảo trá",
  "đồ phản bội", "đồ xảo quyệt", "đồ phản trắc", "đồ lừa đảo", "đồ gian trá", "đồ lừa lọc",
  "đồ phản trắc", "đồ gian manh", "đồ lừa lọc", "đồ xảo trá", "đồ gian trá", "đồ lừa đảo",
  "đồ phản trắc", "đồ phản bội", "đồ gian trá", "đồ lừa lọc", "đồ gian dối", "đồ lừa đảo",
  "đồ xảo quyệt", "đồ gian manh", "đồ lừa lọc", "đồ phản bội", "đồ gian trá","tồi tệ", "tàn ác", "tàn nhẫn", "hung ác", "hung bạo", "hung dữ", "ác độc", "ác tâm", "ác ý",
  "tàn bạo", "bạo tàn", "bạo lực", "hung hãn", "hung hiểm", "thâm độc", "xảo quyệt", "quái ác",
  "quỷ quái", "ma quái", "tử thần", "địa ngục", "hỏa ngục", "lưỡi hái tử thần", "đao phủ",
  "bạo chúa", "bạo quân", "tà ác", "hắc ám", "quỷ dữ", "quỷ sứ", "quỷ ám", "bóng tối", "ma mị",
  "ma thuật", "tà thuật", "hắc thuật", "phù thủy", "pháp sư", "ma quỷ", "ma cà rồng", "quỷ hút máu",
  "người sói", "quái vật", "quái nhân", "kẻ cuồng sát", "cuồng bạo", "loạn trí", "loạn thần",
  "cuồng loạn", "kẻ giết người", "sát nhân", "tội phạm", "tội đồ", "tội ác", "tội phạm nguy hiểm",
  "đánh bom", "khủng bố", "nổ bom", "bắn giết", "bạo động", "bạo loạn", "bạo lực", "xâm lược",
  "xâm chiếm", "chiến tranh", "tử vong", "thiệt mạng", "tử nạn", "tử trận", "thi thể", "xác chết",
  "xác người", "mồ mả", "quan tài", "tang lễ", "ma chay", "hỏa táng", "an táng", "chôn cất",
  "thủy táng", "thiêu", "đốt xác", "lăng mộ", "mộ phần", "bia mộ", "mộ bia", "nhà xác", "nhà quàn",
  "pháp y", "mổ tử thi", "khám nghiệm tử thi", "thiên táng", "địa táng", "đám ma", "lễ tang",
  "quan tài", "mộ chí", "băng đảng", "xã hội đen", "băng nhóm", "đầu gấu", "ma cô", "ma cạo",
  "dân anh chị", "anh chị", "giang hồ", "gã giang hồ", "đầu trọc", "côn đồ", "dân xã hội",
  "dân anh chị", "cai thầu", "cai thầu xây dựng", "cai thầu bảo kê", "bảo kê", "thu tiền bảo kê",
  "xã hội đen", "đầu gấu", "đâm thuê chém mướn", "băng nhóm", "đường dây", "ma túy", "ma dược",
  "thuốc phiện", "thuốc lắc", "heroin", "cocaine", "ma túy đá", "cỏ Mỹ", "cỏ", "nấm thức thần",
  "hút chích", "phê ma túy", "phê thuốc", "nghiện ngập", "nghiện ma túy", "ngáo đá", "ngáo",
  "phê đá", "hút chích", "mua bán ma túy", "buôn ma túy", "mại dâm", "bán dâm", "mua dâm",
  "gái gọi", "gái đứng đường", "trai bao", "gái bao", "trai gọi", "má mì", "dắt gái", "chăn dắt",
  "buôn người", "bán người", "buôn lậu", "buôn hàng lậu", "vận chuyển ma túy", "vận chuyển hàng lậu",
  "hàng lậu", "buôn lậu người", "mua bán trẻ em", "mua bán nội tạng", "cướp bóc", "cướp của",
  "giết người cướp của", "tội phạm mạng", "hack", "hacker", "tin tặc", "virus máy tính",
  "phần mềm độc hại", "malware", "trojan", "phần mềm gián điệp", "spyware", "keylogger", "ransomware",
  "chiếm đoạt tài khoản", "chiếm quyền điều khiển", "tấn công mạng", "đánh cắp thông tin", "ăn cắp danh tính",
  "phá hoại dữ liệu", "phá hoại hệ thống", "tấn công DDoS", "tấn công từ chối dịch vụ", "phát tán virus",
  "lừa đảo qua mạng", "phishing", "scam", "gian lận trực tuyến", "lừa đảo trực tuyến", "tấn công lừa đảo",
  "chiếm đoạt tài sản", "chiếm đoạt thông tin", "gian lận tài chính", "lừa đảo tài chính", "mua sắm gian lận",
  "mua hàng gian lận", "bán hàng gian lận", "gian lận mua bán", "gian lận thương mại", "trộm cắp thông tin",
  "đánh cắp thông tin", "ăn cắp dữ liệu", "xâm nhập hệ thống", "xâm nhập máy tính", "xâm nhập trái phép",
  "truy cập trái phép", "phá hoại thông tin", "phá hoại hệ thống", "tấn công hệ thống", "hack hệ thống",
  "cài mã độc", "phát tán mã độc", "tấn công từ xa", "tấn công mạng", "tấn công mạng nội bộ", "hack mạng nội bộ",
  "hack máy chủ", "tấn công máy chủ", "phá hoại máy chủ", "chiếm quyền máy chủ", "đánh cắp dữ liệu máy chủ",
  "chiếm đoạt quyền điều khiển", "chiếm đoạt thông tin", "xâm nhập dữ liệu", "xâm nhập mạng", "xâm nhập trái phép",
  "hack dữ liệu", "tấn công DDoS", "phát tán virus", "phát tán mã độc", "phát tán phần mềm độc hại",
  "phát tán phần mềm gián điệp", "phát tán spyware", "cài đặt phần mềm độc hại", "cài đặt malware",
  "cài đặt trojan", "cài đặt spyware", "phát tán keylogger", "cài đặt keylogger", "phát tán ransomware",
  "cài đặt ransomware", "tấn công tài khoản", "tấn công thông tin", "tấn công người dùng", "tấn công khách hàng",
  "tấn công doanh nghiệp", "tấn công cá nhân", "tấn công tổ chức", "tấn công cơ quan", "tấn công chính phủ",
  "phá hoại tài khoản", "phá hoại thông tin", "phá hoại hệ thống", "phá hoại doanh nghiệp", "phá hoại cá nhân",
  "phá hoại tổ chức", "phá hoại cơ quan", "phá hoại chính phủ", "chiếm đoạt tài khoản", "chiếm đoạt thông tin",
  "chiếm đoạt dữ liệu", "chiếm đoạt hệ thống", "chiếm đoạt mạng", "chiếm đoạt quyền điều khiển",
  "chiếm đoạt quyền truy cập", "chiếm đoạt quyền quản lý", "chiếm đoạt quyền sở hữu", "chiếm đoạt quyền sử dụng",
  "đánh cắp tài khoản", "đánh cắp thông tin", "đánh cắp dữ liệu", "đánh cắp quyền điều khiển", "đánh cắp quyền truy cập",
  "đánh cắp quyền quản lý", "đánh cắp quyền sở hữu", "đánh cắp quyền sử dụng", "chiếm quyền tài khoản",
  "chiếm quyền truy cập", "chiếm quyền điều khiển", "chiếm quyền sở hữu", "chiếm quyền sử dụng",
  "chiếm quyền quản lý", "phá hoại tài khoản", "phá hoại thông tin", "phá hoại dữ liệu", "phá hoại quyền điều khiển",
  "phá hoại quyền truy cập", "phá hoại quyền sở hữu", "phá hoại quyền sử dụng", "phá hoại quyền quản lý",
  "phá hoại hệ thống", "phá hoại mạng", "phá hoại doanh nghiệp", "phá hoại cá nhân", "phá hoại tổ chức",
  "phá hoại cơ quan", "phá hoại chính phủ", "phá hoại an ninh", "phá hoại an ninh mạng","phá hoại an ninh quốc gia", "phá hoại an ninh thông tin", "phá hoại an ninh dữ liệu", "phá hoại an ninh cá nhân",
  "phá hoại an ninh tổ chức", "phá hoại an ninh doanh nghiệp", "phá hoại an ninh chính phủ", "tấn công an ninh",
  "tấn công an ninh mạng", "tấn công an ninh quốc gia", "tấn công an ninh thông tin", "tấn công an ninh dữ liệu",
  "tấn công an ninh cá nhân", "tấn công an ninh tổ chức", "tấn công an ninh doanh nghiệp", "tấn công an ninh chính phủ",
  "phá hoại cơ sở hạ tầng", "phá hoại cơ sở dữ liệu", "phá hoại cơ sở thông tin", "phá hoại cơ sở mạng",
  "tấn công cơ sở hạ tầng", "tấn công cơ sở dữ liệu", "tấn công cơ sở thông tin", "tấn công cơ sở mạng",
  "đánh cắp thông tin cá nhân", "đánh cắp thông tin tổ chức", "đánh cắp thông tin doanh nghiệp", "đánh cắp thông tin chính phủ",
  "đánh cắp thông tin quốc gia", "đánh cắp dữ liệu cá nhân", "đánh cắp dữ liệu tổ chức", "đánh cắp dữ liệu doanh nghiệp",
  "đánh cắp dữ liệu chính phủ", "đánh cắp dữ liệu quốc gia", "xâm nhập thông tin cá nhân", "xâm nhập thông tin tổ chức",
  "xâm nhập thông tin doanh nghiệp", "xâm nhập thông tin chính phủ", "xâm nhập thông tin quốc gia", "xâm nhập dữ liệu cá nhân",
  "xâm nhập dữ liệu tổ chức", "xâm nhập dữ liệu doanh nghiệp", "xâm nhập dữ liệu chính phủ", "xâm nhập dữ liệu quốc gia",
  "tấn công dữ liệu cá nhân", "tấn công dữ liệu tổ chức", "tấn công dữ liệu doanh nghiệp", "tấn công dữ liệu chính phủ",
  "tấn công dữ liệu quốc gia", "tấn công thông tin cá nhân", "tấn công thông tin tổ chức", "tấn công thông tin doanh nghiệp",
  "tấn công thông tin chính phủ", "tấn công thông tin quốc gia", "phá hoại hệ thống mạng", "phá hoại hệ thống thông tin",
  "phá hoại hệ thống dữ liệu", "phá hoại hệ thống an ninh", "phá hoại hệ thống cơ sở hạ tầng", "phá hoại hệ thống cơ sở dữ liệu",
  "tấn công hệ thống mạng", "tấn công hệ thống thông tin", "tấn công hệ thống dữ liệu", "tấn công hệ thống an ninh",
  "tấn công hệ thống cơ sở hạ tầng", "tấn công hệ thống cơ sở dữ liệu", "đánh cắp hệ thống mạng", "đánh cắp hệ thống thông tin",
  "đánh cắp hệ thống dữ liệu", "đánh cắp hệ thống an ninh", "đánh cắp hệ thống cơ sở hạ tầng", "đánh cắp hệ thống cơ sở dữ liệu",
  "xâm nhập hệ thống mạng", "xâm nhập hệ thống thông tin", "xâm nhập hệ thống dữ liệu", "xâm nhập hệ thống an ninh",
  "xâm nhập hệ thống cơ sở hạ tầng", "xâm nhập hệ thống cơ sở dữ liệu", "tấn công hệ thống cá nhân", "tấn công hệ thống tổ chức",
  "tấn công hệ thống doanh nghiệp", "tấn công hệ thống chính phủ", "tấn công hệ thống quốc gia", "phá hoại hệ thống cá nhân",
  "phá hoại hệ thống tổ chức", "phá hoại hệ thống doanh nghiệp", "phá hoại hệ thống chính phủ", "phá hoại hệ thống quốc gia",
  "đánh cắp hệ thống cá nhân", "đánh cắp hệ thống tổ chức", "đánh cắp hệ thống doanh nghiệp", "đánh cắp hệ thống chính phủ",
  "đánh cắp hệ thống quốc gia", "xâm nhập hệ thống cá nhân", "xâm nhập hệ thống tổ chức", "xâm nhập hệ thống doanh nghiệp",
  "xâm nhập hệ thống chính phủ", "xâm nhập hệ thống quốc gia", "tấn công hệ thống dữ liệu cá nhân", "tấn công hệ thống dữ liệu tổ chức",
  "tấn công hệ thống dữ liệu doanh nghiệp", "tấn công hệ thống dữ liệu chính phủ", "tấn công hệ thống dữ liệu quốc gia",
  "phá hoại hệ thống dữ liệu cá nhân", "phá hoại hệ thống dữ liệu tổ chức", "phá hoại hệ thống dữ liệu doanh nghiệp",
  "phá hoại hệ thống dữ liệu chính phủ", "phá hoại hệ thống dữ liệu quốc gia", "đánh cắp hệ thống dữ liệu cá nhân",
  "đánh cắp hệ thống dữ liệu tổ chức", "đánh cắp hệ thống dữ liệu doanh nghiệp", "đánh cắp hệ thống dữ liệu chính phủ",
  "đánh cắp hệ thống dữ liệu quốc gia", "xâm nhập hệ thống dữ liệu cá nhân", "xâm nhập hệ thống dữ liệu tổ chức",
  "xâm nhập hệ thống dữ liệu doanh nghiệp", "xâm nhập hệ thống dữ liệu chính phủ", "xâm nhập hệ thống dữ liệu quốc gia",
  "tấn công hệ thống thông tin cá nhân", "tấn công hệ thống thông tin tổ chức", "tấn công hệ thống thông tin doanh nghiệp",
  "tấn công hệ thống thông tin chính phủ", "tấn công hệ thống thông tin quốc gia", "phá hoại hệ thống thông tin cá nhân",
  "phá hoại hệ thống thông tin tổ chức", "phá hoại hệ thống thông tin doanh nghiệp", "phá hoại hệ thống thông tin chính phủ",
  "phá hoại hệ thống thông tin quốc gia", "đánh cắp hệ thống thông tin cá nhân", "đánh cắp hệ thống thông tin tổ chức",
  "đánh cắp hệ thống thông tin doanh nghiệp", "đánh cắp hệ thống thông tin chính phủ", "đánh cắp hệ thống thông tin quốc gia",
  "xâm nhập hệ thống thông tin cá nhân", "xâm nhập hệ thống thông tin tổ chức", "xâm nhập hệ thống thông tin doanh nghiệp",
  "xâm nhập hệ thống thông tin chính phủ", "xâm nhập hệ thống thông tin quốc gia", "tấn công an ninh dữ liệu cá nhân",
  "tấn công an ninh dữ liệu tổ chức", "tấn công an ninh dữ liệu doanh nghiệp", "tấn công an ninh dữ liệu chính phủ",
  "tấn công an ninh dữ liệu quốc gia", "phá hoại an ninh dữ liệu cá nhân", "phá hoại an ninh dữ liệu tổ chức",
  "phá hoại an ninh dữ liệu doanh nghiệp", "phá hoại an ninh dữ liệu chính phủ", "phá hoại an ninh dữ liệu quốc gia",
  "đánh cắp an ninh dữ liệu cá nhân", "đánh cắp an ninh dữ liệu tổ chức", "đánh cắp an ninh dữ liệu doanh nghiệp",
  "đánh cắp an ninh dữ liệu chính phủ", "đánh cắp an ninh dữ liệu quốc gia", "xâm nhập an ninh dữ liệu cá nhân",
  "xâm nhập an ninh dữ liệu tổ chức", "xâm nhập an ninh dữ liệu doanh nghiệp", "xâm nhập an ninh dữ liệu chính phủ",
  "xâm nhập an ninh dữ liệu quốc gia", "tấn công an ninh thông tin cá nhân", "tấn công an ninh thông tin tổ chức",
  "tấn công an ninh thông tin doanh nghiệp", "tấn công an ninh thông tin chính phủ", "tấn công an ninh thông tin quốc gia",
  "phá hoại an ninh thông tin cá nhân", "phá hoại an ninh thông tin tổ chức", "phá hoại an ninh thông tin doanh nghiệp",
  "phá hoại an ninh thông tin chính phủ", "phá hoại an ninh thông tin quốc gia", "đánh cắp an ninh thông tin cá nhân",
  "đánh cắp an ninh thông tin tổ chức", "đánh cắp an ninh thông tin doanh nghiệp", "đánh cắp an ninh thông tin chính phủ",
  "đánh cắp an ninh thông tin quốc gia", "xâm nhập an ninh thông tin cá nhân", "xâm nhập an ninh thông tin tổ chức",
  "xâm nhập an ninh thông tin doanh nghiệp", "xâm nhập an ninh thông tin chính phủ", "xâm nhập an ninh thông tin quốc gia",
  "tấn công hệ thống an ninh mạng cá nhân", "tấn công hệ thống an ninh mạng tổ chức", "tấn công hệ thống an ninh mạng doanh nghiệp",
  "tấn công hệ thống an ninh mạng"
];