#include "backend.h"
#include "QDebug"

Backend::Backend(QObject *parent)
    : QObject{parent}
{


}

/*
 *
 *
 * */
QString Backend::language()
{
    QString sentence;
    if(word_pool.size()>0){
        int random = rand()%word_pool.size();
        sentence = word_pool.at(random);

        used_words.push_back(sentence);
        auto it = word_pool.begin() + random;
        word_pool.erase(it);
    }
    else if(used_words.size()>0){
        int random = rand() % used_words.size();
        sentence = used_words.at(random);

    } else{
        sentence = "FISH";
    }
    sentence = sentence.trimmed();
    qInfo()<<sentence;
     return sentence;
}


//Load all the lines of text to the vector once and for all
int Backend::load()
{
    QString path,sentence;
    path = "spanish.txt";
    QFile file(path);


    if(file.open(QIODevice::ReadOnly)){
        while(!file.atEnd()){
            sentence = file.readLine();
            word_pool.push_back(sentence);
        }
        file.close();
    }else{
        qInfo()<<file.errorString();
    }
    qInfo()<<"WORD POOL SIZE IS NOW: "<<word_pool.size();
    return 1;
}
