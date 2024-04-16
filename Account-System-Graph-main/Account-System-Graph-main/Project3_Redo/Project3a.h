//3a
#ifndef PROJECT_3A_H
#define PROJECT_3A_H
#include <iostream>
#include <string>
#include <set>
using namespace std;

class Account {
    private:
        //data
        string accountName;
        set<string> followers;
        set<string> following;

    public:
        //constructors
        Account();
        Account(string newName);
        //deconstructor
        ~Account() {}
        void SetName(string newName);
        set<string> GetFollowers();
        void InsertFollower(string newFollower);
        void InsertFollowing(string newFollowing);
        void PrintFollowers();
        void PrintFollowing();
        //accessors
        int GetNumFollowers();
        int GetNumFollowing();
        string GetName();
};
#endif