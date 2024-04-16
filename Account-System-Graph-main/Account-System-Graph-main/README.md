# Project Overview

The goal of this project was to implement a graph to represent a system
of accounts, some of which are following one another. In each input file,
the account in the second column is following the account in the first.
The root account is the account with the greatest number of followers.
We also want to print every account within depth 2 of the root as a tree,
with each list of followers in alphabetical order.

# Original Implementation

The code consists of two major classes, an account class and a graph class.
The account class contains the distance to the root account (depth), the
account's name, and two vectors each of type Account* , one to store the
account's followers, and the other to store accounts it is following. It
has member functions to check if an account has already been added to the
followers/following and add a follower or following, and sort the vector
of followers using insertion sort. The graph class contains a vector of type
Account* to store the accounts, another Account pointer to store the root,
and a vector of type Account to store a list of accounts within depth 2.
It has member functions to check if an account had been added, to return an
existing account given a string name, to set the root, to populate the
vector of accounts of depth 2, and another to print them.

# Noteable Differences in Second Implementation

<li><strong>Sets to store followers and following:</strong><br>
    Sets of type string are used to store followers and following in the
    account class. This prevents duplicates and is ordered, so there is no
    need to iterate through each to check if the element being inserted is
    already present. Also, nothing additional needs to be done to print
    the followers in alphabetical order since this is already done by the set.</li>

<li><strong>Replacing vectors with lists in Graph class:</strong><br>
    Lists of type Account* are used in the graph class to store each account.
    Accounts are inserted in alphabetical order as they are added, and duplicates
    are not added. The vector either requires shifting elements after the position
    a new element is inserted, or needs to be sorted later. To check for duplicates
    and either sort a vector or shift elements, the vector must be iterated through
    twice depending on the sorting algorithm used. A list needs to be iterated
    through once to both check for a duplicate and insert a new element in the
    correct position. Also, the shifting issue in vectors is avoided with lists.</li>

<li><strong>Keep track of root account as accounts are added:</strong><br>
    When a new follower is added to an account in the graph, a function is called to
    check if the account that gained a follower now has more followers than the
    current root. If it does, the root is updated. This avoids the need to search
    the list of accounts again after they have all been read from the input file.</li>

<li><strong>Removed unused data members from both classes:</strong><br>
    Root distance data member was removed from Account class, accounts within
    depth 2 vector was removed from Graph class. Some accounts have two different
    depths from the root. Also, there is no need to go through the same list twice,
    so the accounts within depth 2 are printed as the followers of the root are
    transversed. This both saves memory and improves runtime.</li>
    
# Runtime Comparison

(Not including reading from the input file)<br>
<strong>Adding account to graph in both versions:</strong> O(N)<br>
<strong>Searching for an account from a name in both versions:</strong> O(N)<br>
<strong>Inserting a follower/following account:</strong> O(N) using vectors
in first version to check for a duplicate, O(1) using a set<br>
<strong>Sorting followers:</strong> O(N<sup>2</sup>) using insertion sort to order
a vector, O(1) using a set<br>
<strong>Finding the root account:</strong> O(N) in original to set the root after file has been
fully read, O(1) to update the root as a follower to an account is added<br>
<strong>Printing accounts within depth 2: </strong>Second version only needs to iterate,
only printing rather than populating a vector and then printing the vector<br>