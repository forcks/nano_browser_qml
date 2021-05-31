#include <QDebug>

#include "appengine.h"

void appEngine::getUrl(QString url)
{
    setUrlInSearchInput(url);
}

void appEngine::search(QString url)
{
    if(!url.startsWith("ftp://") && !url.startsWith("http://") && !url.startsWith("gother://") && !url.startsWith("https://"))
        url="https://"+url;
    setUrl(url);
}

void appEngine::addPage()
{
    setPage();
}
