function tictactoe_robotic_center(job)
global sky;
if nargin == 0
   X = zeros(3,3);
   game = 2;
   B = buttons;
   job = '';
   r = 0;
else
   [X,game,B,r] = getgame;
end

switch job
   case 'green'
      %[i,j] = find(gcbo == B);
      if winner(X)
         sky = r;
         return;
      end
      [i,j] = strategy(X,1);
      X(i,j) = 1;
      savegame(X,game,B,r)
      tictactoe_robotic_center('blue')
      return

   case 'blue'
      if winner(X)
         sky = r;
         return;
      end
      [i,j] = strategy(X,-1);
      X(i,j) = -1;
      savegame(X,game,B,r)
      tictactoe_robotic_center('green');
      return

   case 'game'
      game = mod(game,3)+1;
      

   case 'start'
      X = zeros(3,3);

   case 'exit'
      close(gcf)
      return
end
savegame(X,game,B,r);


% ------------------------

function p = winner(X)
% p = winner(X) returns
%    p = 0, no winner yet,
%    p = -1, blue has won,
%    p = 1, green has won,
%    p = 2, game is a draw.

for p = [-1 1]
   s = 3*p;
   win = any(sum(X) == s) || any(sum(X') == s) || ...
         sum(diag(X)) == s  || sum(diag(fliplr(X))) == s;
   if win
      return
   end
end
p = 2*all(X(:) ~= 0);

% ------------------------

function [i,j] = winningmove(X,p);
% [i,j] = winningmove(X,p) finds any winning move for player p.

s = 2*p;
if any(sum(X) == s)
   j = find(sum(X) == s);
   i = find(X(:,j) == 0);
elseif any(sum(X') == s)
   i = find(sum(X') == s);
   j = find(X(i,:) == 0);
elseif sum(diag(X)) == s
   i = find(diag(X) == 0);
   j = i;
elseif sum(diag(fliplr(X))) == s
   i = find(diag(fliplr(X)) == 0);
   j = 4 - i;
else
   i = [];
   j = [];
end

% ------------------------

function [i,j] = strategy(X,p);
% [i,j] = strategy(X,p) is a good, but not perfect, move for player p.

% Appear to think.
pause(0.01)

% If possible, make a winning move.
[i,j] = winningmove(X,p);

% Block any winning move by opponent.
if isempty(i)
   [i,j] = winningmove(X,-p);
end

% Otherwise, make a random move.
if isempty(i)
   [i,j] = find(X == 0);
   if X(2,2) ~= 0
        m = ceil(rand*length(i));
        i = i(m);
        j = j(m);
   else
       i = 2;
       j = 2;
   end
end

% ------------------------

function B = buttons
% Initialize push buttons and text.
clf
shg
set(gcf,'menubar','none','numbertitle','off','name','Tictactoe')
B = zeros(3,3);
M = magic(3);
for k = 1:9
   [i,j] = find(k == M);
   B(i,j) = uicontrol('style','pushbutton','units','normal', ...
      'fontsize',16,'callback','tictactoe(''green'')');
end
uicontrol('style','text','units','normal','pos',[0.30 0.82 0.40 0.10], ...
   'fontsize',20,'background',get(gcf,'color'),'tag','toptext');
uicontrol('style','text','units','normal','pos',[0.20 0.72 0.60 0.10], ...
   'fontsize',10,'background',get(gcf,'color'),'tag','toptext','string', ...
   ['Pick single digit numbers.  Each digit can be chosen only once. ' ...
    'Generate a total of 15 using exactly three digits.'])
% uicontrol('style','pushbutton','units','normal','string','Game', ...
%    'fontsize',12,'position',[.23 .12 .15 .07], ...
%    'callback','tictactoe(''game'')');
% uicontrol('style','pushbutton','units','normal','string','Start', ...
%    'fontsize',12,'position',[.43 .12 .15 .07], ...
%    'callback','tictactoe(''start'')');
uicontrol('style','pushbutton','units','normal','string','Exit', ...
   'fontsize',12,'position',[.43 .12 .15 .07], ...
   'callback','tictactoe_robotic_center(''exit'')');

% ------------------------

function [X,game,B,r] = getgame
% Restore the state of the game.
ud = get(gcf,'userdata');
X = ud{1};
game = ud{2};
B = ud{3};
r = ud{4};

% ------------------------

function savegame(X,game,B,r)
global sky;
% Update the display and save the state of the game.
M = magic(3);
for k = 1:9
   [i,j] = find(k == M);
   switch game
      case 1  % Pick15
         pos = [0.10*k-0.055 0.50 0.10 0.1333];
         str = int2str(k);
      case 2  % TicTacToe
         pos = [0.10*j+0.25 0.1333*(4-i)+0.17 0.10 0.1333];
         str = '';
      case 3  % Magic3
         pos = [0.10*j+0.25 0.1333*(4-i)+0.17 0.10 0.1333];
         str = int2str(k);
   end
   switch X(i,j)
      case -1
         bg = 'blue'; 
      case 0
         bg = 'white'; 
      case 1
         bg = 'green'; 
   end
   set(B(i,j),'position',pos,'string',str,'background',bg);
end
T = flipud(findobj(gcf,'tag','toptext'));
set(T(2),'visible','off');
switch winner(X)
   case 0,
      switch game
         case 1, set(T(1),'string','Pick15')
                 set(T(2),'visible','on')
         case 2, set(T(1),'string','TicTacToe')
         case 3, set(T(1),'string','Magic3')
      end
   case -1, set(T(1),'string','Blue wins')
            r = -1;
   case 1, set(T(1),'string','Green wins')
           r = 1;
   case 2, set(T(1),'string','Draw')
           r = 0;
end
set(gcf,'userdata',{X,game,B,r})


