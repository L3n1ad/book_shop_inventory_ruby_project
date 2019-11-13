require('pp')
require('pry-byebug')
require_relative('../models/author.rb')
require_relative('../models/book.rb')
require_relative('../models/publication.rb')
require_relative('../models/item.rb')

Publication.delete_all()
Item.delete_all()
Author.delete_all()
Book.delete_all()

author1 = Author.new('first_name' => 'Ernest','last_name' => 'Cline','date_of_birth' => 29031972,'description' => "Ernest Christy Cline (born March 29, 1972) is an American novelist, slam poet, and screenwriter. He is known for his novels Ready Player One and Armada; he also co-wrote the screenplay for the film adaptation of Ready Player One, directed by Steven Spielberg.", 'profile_img' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Ernest_Cline_by_Gage_Skidmore.jpg/440px-Ernest_Cline_by_Gage_Skidmore.jpg')
author2 = Author.new('first_name' => 'Takami','last_name' => 'Hirohura','date_of_birth' => 10011969,'description' => 'Kōshun Takami (高見 広春 Takami Kōshun, born 10 January 1969) is a Japanese author and journalist. He is best known for his 1999 novel Battle Royale,[1] which was later adapted into two live-action films, directed by Kinji Fukasaku, and three manga series.', 'profile_img' => 'https://cdn1.booknode.com/author_picture/505/full/k-shun-takami-504861.jpg')
author3 = Author.new('first_name' => 'Stephen','last_name' => 'Edwin King','date_of_birth' => 21091947,'description' => "Stephen Edwin King (born September 21, 1947) is an American author of horror, supernatural fiction, suspense, and fantasy novels. His books have sold more than 350 million copies,[2] many of which have been adapted into feature films, miniseries, television series, and comic books. King has published 61 novels (including seven under the pen name Richard Bachman) and six non-fiction books.[3] He has written approximately 200 short stories,[4][5] most of which have been published in book collections.", 'profile_img' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Stephen_King%2C_Comicon.jpg/440px-Stephen_King%2C_Comicon.jpg')
author4 = Author.new('first_name' => 'Terry','last_name' => 'Pratchett','date_of_birth' => 28041948,'description' => 'Sir Terence David John Pratchett OBE (28 April 1948 – 12 March 2015) was an English humorist, satirist, and author of fantasy novels, especially comical works.[2] He is best known for his Discworld series of 41 novels.', 'profile_img' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/10.12.12TerryPratchettByLuigiNovi1.jpg/440px-10.12.12TerryPratchettByLuigiNovi1.jpg')
author5 = Author.new('first_name' => 'Neil','last_name' => 'Gaiman','date_of_birth' => 10111960,'description' => "Neil Richard MacKinnon Gaiman[2] (/ˈɡeɪmən/;[3] born Neil Richard Gaiman,[2] 10 November 1960)[4] is an English author of short fiction, novels, comic books, graphic novels, nonfiction, audio theatre, and films. His works include the comic book series The Sandman and novels Stardust, American Gods, Coraline, and The Graveyard Book. He has won numerous awards, including the Hugo, Nebula, and Bram Stoker awards, as well as the Newbery and Carnegie medals. He is the first author to win both the Newbery and the Carnegie medals for the same work, The Graveyard Book (2008).[5][6] In 2013, The Ocean at the End of the Lane was voted Book of the Year in the British National Book Awards.[7]", 'profile_img' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Kyle-cassidy-neil-gaiman-April-2013.jpg/440px-Kyle-cassidy-neil-gaiman-April-2013.jpg')
author6 = Author.new('first_name' => 'Heidi','last_name' => 'Durrow','date_of_birth' => 21061969,'description' => "Heidi W. Durrow (born June 21, 1969) is an American writer, author of best-seller[1] The Girl Who Fell From the Sky, and the winner of the 2008 PEN/Bellwether Prize for Socially-Engaged Fiction.", 'profile_img' => 'https://previews.123rf.com/images/dragonimages/dragonimages1703/dragonimages170306328/73496501-female-writer-drinking-a-cup-of-tea-and-contemplating-about-plot-twist.jpg')

author1.save
author2.save
author3.save
author4.save
author5.save
author6.save

book1 = Book.new('title' => 'Battle Royal','genre' => 'Horror','description' => 'The story tells of junior high school students who are forced to fight each other to the death in a program run by a fictional authoritarian Japanese government, now known as the Republic of Greater East Asia.','year' => 1999, 'cover' => 'https://upload.wikimedia.org/wikipedia/en/4/40/Battle_Royale_Japanese.JPG')
book2 = Book.new('title' => 'Ready Player One','genre' => 'Fantasy','description' => 'Lacero, a fan-fiction story by Andy Weir, was published in the 2016 edition of Ready Player One. It follows the story of Nolan Sorrento and functions as a precursor to the main novel, and is considered canonical to the Ready Player One fictional universe','year' => 2011, 'cover' => 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Ready_Player_One_cover.jpg/220px-Ready_Player_One_cover.jpg')
book3 = Book.new('title' => 'Pet Sematary','genre' => 'Horror','description' => "Louis Creed, a doctor from Chicago, is appointed director of the University of Maine's campus health service. He moves to a large house near the small town of Ludlow with his wife Rachel, their two young children, Ellie and Gage, and Ellie's cat, Church. From the moment they arrive, the family runs into trouble: Ellie hurts her knee and Gage is stung by a bee. Their new neighbor, an elderly man named Jud Crandall, comes to help. He warns Louis and Rachel about the highway that runs past their house, which is frequented by speeding trucks.",'year' => 1983, 'cover' => 'https://upload.wikimedia.org/wikipedia/en/5/52/StephenKingPetSematary.jpg')
book4 = Book.new('title' => 'Good Omens','genre' => 'Comedy','description' => "The book is a comedy about the birth of the son of Satan and the coming of the End Times. There are attempts by the angel Aziraphale and the demon Crowley to sabotage the coming of the end times, having grown accustomed to their comfortable surroundings in England. One subplot features a mixup at the small country hospital on the day of birth and the growth of the Antichrist, Adam, who grows up with the wrong family, in the wrong country village. Another subplot concerns the summoning of the Four Horsemen of the Apocalypse, each a big personality in their own right. In 2003, the novel was listed at number 68 on the BBC's survey The Big Read.[3]",'year' => 1990, 'cover' => 'https://upload.wikimedia.org/wikipedia/en/0/0a/Goodomenscover.jpg')
book5 = Book.new('title' => 'The Girl Who Fell from the Sky','genre' => 'Drama','description' => "A timely and moving bicultural coming-of-age tale, based on a true story and told by an author who has struggled with the same issues as her protagonist.The daughter of a Danish immigrant and a black G.I., Rachel survives a family tragedy only to face new challenges. Sent to live with her strict African-American grandmother in a racially divided Northwest city, she must suppress her grief and reinvent herself in a mostly black community. A beauty with light brown skin and blue eyes, she attracts much attention in her new home.
",'year' => 2010, 'cover' => 'https://lh3.googleusercontent.com/g-ea_uXL_zgJ-2N-qwP5Jn7sglgmeV6wI0fF_zJOyjEJiTKoDetjHFYaxMDA2VkjgkL1BAY8Nluy-Q=s400-rw')
book6 = Book.new('title' => 'Lonely Book','genre' => 'Drama','description' => 'I am very very lonely','year' => 2019, 'cover' => 'https://images-na.ssl-images-amazon.com/images/I/413L6wxs39L._SX330_BO1,204,203,200_.jpg')

book1.save
book2.save
book3.save
book4.save
book5.save
book6.save

publication1 = Publication.new('book_id' => book1.id,'author_id' => author2.id)
publication2 = Publication.new('book_id' => book2.id,'author_id' => author1.id)
publication3 = Publication.new('book_id' => book3.id,'author_id' => author3.id)
publication4 = Publication.new('book_id' => book4.id,'author_id' => author4.id)
publication5 = Publication.new('book_id' => book4.id,'author_id' => author5.id)
publication6 = Publication.new('book_id' => book5.id,'author_id' => author6.id)
publication7 = Publication.new('book_id' => book4.id,'author_id' => author6.id)
publication8 = Publication.new('book_id' => book3.id,'author_id' => author6.id)
publication9 = Publication.new('book_id' => book2.id,'author_id' => author6.id)

publication1.save
publication2.save
publication3.save
publication4.save
publication5.save
publication6.save
publication7.save
publication8.save
publication9.save

item1 = Item.new('book_id' => book1.id, 'quantity' => 1, 'buying_cost' => 4.25, 'selling_price' => 7.75)
item2 = Item.new('book_id' => book2.id, 'quantity' => 5, 'buying_cost' => 4, 'selling_price' => 6.50)
item3 = Item.new('book_id' => book3.id, 'quantity' => 3, 'buying_cost' => 4.50, 'selling_price' => 8.50)
item4 = Item.new('book_id' => book4.id, 'quantity' => 10, 'buying_cost' => 3.75, 'selling_price' => 7.25)
item5 = Item.new('book_id' => book5.id, 'quantity' => 4, 'buying_cost' => 4.50, 'selling_price' => 7.75)



item1.save
item2.save
item3.save
item4.save
item5.save





binding pry
nil
