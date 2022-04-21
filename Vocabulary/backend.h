#ifndef BACKEND_H
#define BACKEND_H

/*
 *           PSEUDOCODE FOR THE VOCABULARY GAME
 *
 * Program flow
 *
 * when the game is initiated;
 * 1. The user selects the game he is playing...
 *  e.g
 *       1 - Spanish
 *       2 - Igbo
 *    Based on this information from the qml //which can be read with q_property
 *
 *    When we choose 1 (for instance)
 *
 *    private variable = 1
 *    Open the Spanish.txt file
 *      Read all the lines from the text file
 *      push them into a vector called word_pool
 *
 *    In the QML aspect, it is assumed that the user has defined the number of words
 *    that he wants to try out.
 *
 *      Therefore, after each game, the Javascript removes one, and the javascript is used to
 *      request for Words on the condition that the maximum has not run out...
 *
 *      The words are sought by random,
 *      when they are submitted to the javascript, they are removed from word_pool and
 *      they are put in a vector called used_words...
 *
 *      if the java script keeps asking, the cpp changes sources of words from the
 *      word-pool (since it can run out) to the used_words (not minding the repitiationsq
 *
 *
 * variables that are to be defined
 *
 * wh
 * */

#include <QObject>
#include <fstream>
#include <cstdlib>
#include <vector>
#include <string>
#include <time.h>
#include <iterator>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int language READ language WRITE setLanguage)
public:
    explicit Backend(QObject *parent = nullptr);


    //This function passes a line with spanish & english meaning to the Js
    //It is in the gameline function that used_words has a possibility of being called

    std::string gameline();
    void setLanguage(int); //when the language 'choice' is set, the word_pool will be prepared

    std::vector<std::string>word_pool;
    std::vector<std::string>used_words;


private:
    int language{};

signals:

};

#endif // BACKEND_H
