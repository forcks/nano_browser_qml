#ifndef APPENGINE_H
#define APPENGINE_H

#include <QObject>
#include <QString>

class appEngine : public QObject
{
    Q_OBJECT

public:
    appEngine(){};

signals:
    void setUrl(QString url);
    void setUrlInSearchInput(QString url);
    void setPage();
    void destroyPage(QString index);

public slots:
    void getUrl(QString url);
    void search(QString url);
    void addPage();
    void deletePage(QString index);
};

#endif // APPENGINE_H
