#include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{

}

std::string Backend::gameline()
{
    /*
     * How it works
     *      bare structure
     * The javascript calls the game line
     *
     *      the cpp's job is to return a string with the english and the spanish
     *      after the cpp returns that string, the string is moved to the region of used words...
     *      the word is removed out of the word pool...
     *      if the word_pool size == 0, then the word is gotten from the used words...
     *
     *      get the size of word_pool
     *      if the size > 0{
     *       generate a random number from 0 to that number (less 1)
     *      set gameword to be the vector element at that random number
     *
     *      remove gameword from the word_pool
     *      push it into used words
     *      }
     *      else{
     *          get the size of used words
     *          give the user a word from used words instead, and this continues to be the word
     *          source until the game ends....
     *      }
     *
     *      return the "gameword" to the person asking
     *
     *
     * */
    std::string gameword;

    if(word_pool.size()>0){
        int randnum;
        srand(time(nullptr));
        randnum = rand() % word_pool.size();

        //the gameword has now been set and is to be pushed into used_words
        gameword = word_pool.at(randnum);
        used_words.push_back(gameword);

        auto iterator = word_pool.begin() + randnum;
        word_pool.erase(iterator);
    }
    else{
        int randnum;
        srand(time(nullptr));
        randnum = rand() % used_words.size();

        //the gameword has now been set and is to be pushed into used_words
        gameword = used_words.at(randnum);
    }
    return gameword;
}


void Backend::setLanguage(int num)
{
   language = num;

    std::string path;
    std::ifstream in_file;
    if(language == 1){
        //The user has chosen to play Spanish
        path = "word/spanish.txt";
    }
    else if(language == 2){
        path = "word/igbo.txt";
    }
    in_file.open(path);
    std::string line;

    //all the words of the document
    while(std::getline(in_file,line)){
        word_pool.push_back(line);
    }

    in_file.close();
}
