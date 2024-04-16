//3a
#ifndef PROJECT_3A_H
#define PROJECT_3A_H
#include <iostream>
#include <string>
#include <vector>
#include <set>
using namespace std;

class Account {
    private:
        //data
        string accountName;
        int root_dist;
        vector<Account*> followers;
        vector<Account*> following;
    public:
        //constructors
        Account();
        Account(string newName);
        Account(string newName, int newDist);
        //deconstructor
        ~Account() {}
        void SetName(string newName);
        vector<Account*> GetFollowers();
        void SetRootDist(int newDist);
        void InsertFollower(Account* newFollower);
        void InsertFollowing(Account* newFollowing);
        void PrintFollowers();
        void PrintFollowing();
        //accessors
        int GetNumFollowers();
        int GetNumFollowing();
        int GetRootDist();
        string GetName();
        void SortFollowers();
};
#endif