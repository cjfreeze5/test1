#include "Graph.h"
#include <iostream>
using namespace std;


Graph::Graph() {
    root = NULL;
}

void Graph::AddAccount(string newAccount) {
    bool added = false;
    Account temp;
    list<Account*>::iterator i = myaccounts.begin();
    if (myaccounts.size() == 0) {
        //temp = new Account(newAccount);
        myaccounts.push_back(new Account(newAccount));
        return;
    }
    //if new account should be last in the list
    else if ((myaccounts.back())->GetName() < newAccount){
        myaccounts.push_back(new Account(newAccount));
        return;
    }
    //find account's place in the list
    else {
        while(i != myaccounts.end()) {
            //if account was already added
            if ((*i)->GetName() == newAccount) {
                added = true;
                break;
            }
            if ((*i)->GetName() > newAccount) {
                break;
            }
            ++i;
        }        
        if (!added) {
            myaccounts.insert(i, new Account(newAccount));
        }
    }
}

Account* Graph::GetAccountFromName(string account) {
    Account* temp;
    list<Account*>::iterator i;
    for (i = myaccounts.begin(); i != myaccounts.end(); ++i) {
        if ((*i)->GetName() == account) {
            temp = *i;
            break;
        }
    }
    return temp;
}


void Graph::PrintAccounts() {
    cout << "ACCOUNTS:" << endl;
    list<Account*>::iterator i;
    for (i = myaccounts.begin(); i != myaccounts.end(); ++i) {
        cout << (*i)->GetName() << endl;
    }
}

void Graph::UpdateRoot(Account* newAccount) {
    if (root == NULL) {
        root = newAccount;
    }
    else if (newAccount->GetNumFollowers() > root->GetNumFollowers()) {
        root = newAccount;
    }
    //break tie using alphabet
    else if (newAccount->GetNumFollowers() == root->GetNumFollowers()) {
        if (newAccount->GetName() < root->GetName()) {
            root = newAccount;
        }
    }       
}

Account* Graph::GetRoot() {
    return root;
}

void Graph::PrintSN() {
    //identify root and number of users
    cout << "The root user is " << root->GetName();
    cout <<", with in-degree centrality of " << root->GetNumFollowers() << "." << endl;
    cout << "There are " << myaccounts.size() << " users in the social network." << endl;
    cout << root->GetName() << " (0)" << endl;

    set<string>::iterator iter, iter2;
    set<string> rootFollowers = root->GetFollowers();
    set<string> currFollowers;

    //iterate through everything with depth 1
    for (iter = rootFollowers.begin(); iter != rootFollowers.end(); ++iter) {
        cout << *iter << " (1)" << endl;
        currFollowers = GetAccountFromName(*iter)->GetFollowers();
        //depth 2
        for (iter2 = currFollowers.begin(); iter2 != currFollowers.end(); ++iter2) {
            cout << *iter2 << " (2)" << endl;
        }
    }
}