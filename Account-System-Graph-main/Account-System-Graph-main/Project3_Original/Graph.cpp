#include "Graph.h"
#include <iostream>
using namespace std;


Graph::Graph() {
    root = NULL;
}

bool Graph::AccountAdded(string newAccount) {
    bool accountadded = false;
    for (unsigned int i = 0; i < myaccounts.size(); ++i) {
        if (myaccounts.at(i)->GetName() == newAccount) {
            accountadded = true;
        }
    }
    return accountadded;
}

Account* Graph::GetAccountFromName(string account) {
    Account *temp = NULL;
    for (unsigned int i = 0; i < myaccounts.size(); ++i) {
        if (myaccounts.at(i)->GetName() == account) {
            temp = myaccounts.at(i);
        }
    }
    return temp;
}

void Graph::PrintAccounts() {
    cout << "ACCOUNTS:" << endl;
    for (unsigned int j = 0; j < myaccounts.size(); ++j) {
        cout << myaccounts.at(j)->GetName() << endl;
    }
}

void Graph::SetRoot() {
    Account *temp = myaccounts.at(0);
    for (unsigned int i = 1; i < myaccounts.size(); ++i) {
        //check if equal number of followers
        if (myaccounts.at(i)->GetNumFollowers() > temp->GetNumFollowers()) {
            temp = myaccounts.at(i);
        }
        //check if equal
        else if (myaccounts.at(i)->GetNumFollowers() == temp->GetNumFollowers()) {
            //TODO sort alphabetically
            if (myaccounts.at(i)->GetName() < temp->GetName()) {
                temp = myaccounts.at(i);
            }
        }
    }
    root = temp;
    root->SetRootDist(0);
    root->SortFollowers();
}

Account* Graph::GetRoot() {
    return root;
}

//populate in social network
void Graph::BFS() {
    //visit all nodes within depth 1 of the root
    int numFrontier = root->GetNumFollowers();
    int adjFrontier = 0;
    string tempName;
    
    //sort to print in alphabetical order
    root->SortFollowers();
    //cout << "Follwoers sorted for root!" << endl;
    //iterate through everything with depth 1
    for (int i = 0; i < numFrontier; ++i) {

        //sort to print in alphabetical order
        root->GetFollowers().at(i)->SortFollowers();

        //set adjFrontier to visit all adjacent accounts
        adjFrontier = root->GetFollowers().at(i)->GetNumFollowers();
        //add current node to inSN. Get name and distance from root will be 1
        tempName = root->GetFollowers().at(i)->GetName();
        //cout << root->GetFollowers().at(i)->GetName() << " (1)" << endl;
        inSN.push_back(Account(tempName, 1));

        for (int j = 0; j < adjFrontier; ++j) {
            tempName = root->GetFollowers().at(i)->GetFollowers().at(j)->GetName();
            inSN.push_back(Account(tempName, 2));
        }
    }
}

void Graph::PrintSN() {
    cout << "The root user is " << root->GetName();
    cout <<", with in-degree centrality of " << root->GetNumFollowers() << "." << endl;
    cout << "There are " << myaccounts.size() << " users in the social network." << endl;
    cout << root->GetName() << " (0)" << endl;
    for (unsigned int i = 0; i < inSN.size(); ++i) {
        cout << inSN.at(i).GetName() << " (" << inSN.at(i).GetRootDist() << ")" << endl;
    }

}