//Graph
#ifndef GRAPH_H
#define GRAPH_H
#include <iostream>
#include <string>
#include <set>
#include <list>
#include "Project3a.h"
using namespace std;

class Graph {
    private:
        //node storage
        list<Account*> myaccounts;
        Account *root;
    public:
        Graph();
        //adding accounts
        //bool AccountAdded(string newAccount);
        void AddAccount(string newAccount);
        Account* GetAccountFromName(string account);
        void PrintAccounts();
        void UpdateRoot(Account* newAccount);
        Account* GetRoot();
        //identify all accounts within depth 2
        void PrintSN();
};

#endif