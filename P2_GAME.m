function SustainabilityQuizGame
    % SUSTAINABILITYQUIZGAME
    % A sustainability quiz for four professions:
    %   1) Farmer
    %   2) Astronaut
    %   3) Construction Worker
    %   4) Chef
    %
    % Each has 5 questions (3 options each).
    %
    % Mechanics:
    %   - First Pass: User sees questions in order (1 to 5) with immediate feedback.
    %       If incorrect, that question index is stored to be revisited. We still
    %       continue to the next question immediately.
    %   - Second Pass (Review): We ask all questions that were answered incorrectly
    %       in the first pass. The user must keep trying each until correct before
    %       we remove it from the "incorrect" list and move on. Continue until all
    %       are correct.
    %
    % Feel free to modify question text or GUI layout as needed!

    %% ========== 1. DEFINE QUESTIONS FOR EACH PROFESSION ==========

    % --- FARMER ---
    farmer(1).question = 'Eggshells left over. What do you do?';
    farmer(1).options  = { 'Throw them away',...
                           'Compost them',...
                           'Put them outside' };
    farmer(1).correct  = 2;

    farmer(2).question = 'Bugs on your crops. Prevention method?';
    farmer(2).options  = { 'Spray more chemical pesticides!',...
                           'Use plant-based pesticides',...
                           'Choose pest-resistant plants' };
    farmer(2).correct  = 2;

    farmer(3).question = 'Time to feed animals. Best approach?';
    farmer(3).options  = { 'Locally grown feed',...
                           'Cheap food with chemicals',...
                           'Let them eat organic grass outside' };
    % We pick "Locally grown feed" as the best single answer:
    farmer(3).correct  = 1;

    farmer(4).question = 'Need to water crops on a sunny day. Best method?';
    farmer(4).options  = { 'Hose and let it run',...
                           'Use rain-barrel-collected water',...
                           'High-setting sprinklers' };
    farmer(4).correct  = 2;

    farmer(5).question = 'Tractor is low on fuel. What do you do?';
    farmer(5).options  = { 'Use regular gasoline',...
                           'Use biofuel from plants',...
                           'Skip refueling and hope it works' };
    farmer(5).correct  = 2;

    % --- ASTRONAUT ---
    astronaut(1).question = 'Preparing for space mission! Food choice?';
    astronaut(1).options  = { 'Single-use plastic meals',...
                              'Reusable containers & low-waste food',...
                              'Fresh food that might spoil' };
    astronaut(1).correct  = 2;

    astronaut(2).question = 'Travel to space station?';
    astronaut(2).options  = { 'Carpool with friends',...
                              'Take another rocket',...
                              'Use the city bus' };
    astronaut(2).correct  = 1;

    astronaut(3).question = 'Spaceship needs fuel. What to use?';
    astronaut(3).options  = { 'Fossil fuels',...
                              'Renewable eco-friendly energy',...
                              'Any fuel available, ignoring environment' };
    astronaut(3).correct  = 2;

    astronaut(4).question = 'Just launched! Conserve energy how?';
    astronaut(4).options  = { 'Keep all lights on',...
                              'Use solar panels & turn off extras',...
                              'Leave everything running' };
    astronaut(4).correct  = 2;

    astronaut(5).question = 'Space station water is limited. Solution?';
    astronaut(5).options  = { 'Use all you can',...
                              'Recycle and reuse water',...
                              'Ignore supply and hope it lasts' };
    astronaut(5).correct  = 2;

    % --- CONSTRUCTION WORKER ---
    construction(1).question = 'Building a theme park: which materials?';
    construction(1).options  = { 'Cheap, non-sustainable materials',...
                                 'Recycled, eco-friendly materials',...
                                 'Easy-to-transport but wasteful materials' };
    construction(1).correct  = 2;

    construction(2).question = 'Hot day on site. How do you cool off?';
    construction(2).options  = { 'Use a lot of A/C',...
                                 'Drink water & rest in shade',...
                                 'Keep working in the heat' };
    construction(2).correct  = 2;

    construction(3).question = 'There are trees on site. Action?';
    construction(3).options  = { 'Cut them all down',...
                                 'Work around them & plant new ones',...
                                 'Cut some, it won''t matter' };
    construction(3).correct  = 2;

    construction(4).question = 'Fuel for heavy machinery?';
    construction(4).options  = { 'Regular diesel',...
                                 'Electric or renewable energy',...
                                 'Whatever is most convenient' };
    construction(4).correct  = 2;

    construction(5).question = 'Leftover building materials. How to handle?';
    construction(5).options  = { 'Throw them away',...
                                 'Reuse or recycle them',...
                                 'Bury them on-site' };
    construction(5).correct  = 2;

    % --- CHEF ---
    chef(1).question = 'Buying ingredients for a big party. What do you choose?';
    chef(1).options  = { 'Food grown far away with lots of plastic',...
                         'Local produce with less travel',...
                         'Cheapest with preservatives' };
    chef(1).correct  = 2;

    chef(2).question = 'Time to cook! How do you save energy?';
    chef(2).options  = { 'Use multiple stoves if not needed',...
                         'Use stove efficiently & turn off when idle',...
                         'Keep stove on all day' };
    chef(2).correct  = 2;

    chef(3).question = 'Leftover food. What do you do?';
    chef(3).options  = { 'Throw it all away',...
                         'Save for another meal',...
                         'Compost & reuse what you can' };
    % Let’s consider #3 to be the single best approach:
    chef(3).correct  = 3;

    chef(4).question = 'Storing groceries after purchase. Best approach?';
    chef(4).options  = { 'Single-use plastic bags',...
                         'Reusable containers/wraps',...
                         'Leave them on the counter' };
    chef(4).correct  = 2;

    chef(5).question = 'Kitchen uses lots of water. How to reduce?';
    chef(5).options  = { 'Keep water running constantly',...
                         'Use efficient dishwashers & train staff',...
                         'Wash by hand at max pressure' };
    chef(5).correct  = 2;

    % Put everything into one structure for easy referencing
    questions.Farmer = farmer;
    questions.Astronaut = astronaut;
    questions.Construction = construction;
    questions.Chef = chef;

    %% ========== 2. CREATE THE MAIN GUI WINDOW ==========

    fig = figure('Name','Sustainability Quiz Game',...
                 'NumberTitle','off',...
                 'Position',[500 300 500 380],...
                 'MenuBar','none',...
                 'Resize','off');

    % Title
    uicontrol('Style','text',...
              'Parent',fig,...
              'String','Sustainability Quiz Game',...
              'FontSize',14,...
              'FontWeight','bold',...
              'Position',[50 330 400 40]);

    % Instructions
    uicontrol('Style','text',...
              'Parent',fig,...
              'String','Choose a profession to start:',...
              'FontSize',10,...
              'Position',[50 310 400 20]);

    % Profession selection buttons
    btnFarmer = uicontrol('Style','pushbutton',...
                          'Parent',fig,...
                          'String','Farmer',...
                          'Position',[50 260 100 40],...
                          'Callback',@(src,evt)startQuiz('Farmer'));

    btnAstronaut = uicontrol('Style','pushbutton',...
                             'Parent',fig,...
                             'String','Astronaut',...
                             'Position',[190 260 100 40],...
                             'Callback',@(src,evt)startQuiz('Astronaut'));

    btnConstruction = uicontrol('Style','pushbutton',...
                                'Parent',fig,...
                                'String','Construction',...
                                'Position',[330 260 100 40],...
                                'Callback',@(src,evt)startQuiz('Construction'));

    btnChef = uicontrol('Style','pushbutton',...
                        'Parent',fig,...
                        'String','Chef',...
                        'Position',[50 200 100 40],...
                        'Callback',@(src,evt)startQuiz('Chef'));

    % Panel for displaying questions, hidden initially
    questionPanel = uipanel('Parent',fig,...
                            'Units','pixels',...
                            'Position',[50 40 400 140],...
                            'Visible','off');

    questionText = uicontrol('Style','text',...
                             'Parent',questionPanel,...
                             'String','Question Here',...
                             'HorizontalAlignment','left',...
                             'FontSize',10,...
                             'Position',[10 100 380 30]);

    % 3 option radio buttons
    optionButtons = gobjects(3,1);
    for i = 1:3
        optionButtons(i) = uicontrol('Style','radiobutton',...
                                     'Parent',questionPanel,...
                                     'String',['Option ' num2str(i)],...
                                     'HorizontalAlignment','left',...
                                     'Position',[10 100-20*i, 380, 20],...
                                     'Value',0);
    end

    % Submit button
    submitButton = uicontrol('Style','pushbutton',...
                             'Parent',questionPanel,...
                             'String','Submit Answer',...
                             'Position',[270 5 120 30],...
                             'Callback',[],'Visible','on');

    %% ========== 3. DATA STRUCTURE FOR QUIZ STATE ==========

    quizData.profession = '';        % current profession
    quizData.questions = questions;  
    quizData.numQuestions = 5;       % each profession has 5
    quizData.currentQuestionIndex = 0; 
    quizData.optionButtons = optionButtons;
    quizData.questionText = questionText;
    quizData.questionPanel = questionPanel;
    quizData.submitButton = submitButton;

    % We will keep track of incorrect answers and quiz "phase"
    quizData.phase = 'firstPass';    % can be 'firstPass' or 'review'
    quizData.incorrectList = [];     % array of question indices that were answered incorrectly in the first pass
    quizData.reviewIndex = 1;        % index within incorrectList during second pass

    % Store quizData in the figure so it’s accessible in callbacks
    guidata(fig, quizData);

    %% ========== 4. CALLBACKS ==========

    function startQuiz(prof)
        % Called when user clicks one of the profession buttons
        quizData = guidata(fig);

        % Initialize quiz data
        quizData.profession = prof;
        quizData.currentQuestionIndex = 1;
        quizData.phase = 'firstPass';
        quizData.incorrectList = [];
        quizData.reviewIndex = 1;

        % Hide selection buttons
        set(btnFarmer,'Visible','off');
        set(btnAstronaut,'Visible','off');
        set(btnConstruction,'Visible','off');
        set(btnChef,'Visible','off');

        % Show the question panel
        set(quizData.questionPanel,'Visible','on');

        % Set the callback for the submit button
        set(quizData.submitButton,'Callback',@submitAnswer);

        guidata(fig, quizData);
        displayQuestion;
    end

    function displayQuestion
        % Show the current question based on quizData.phase and index
        quizData = guidata(fig);

        if strcmp(quizData.phase,'firstPass')
            % We are in the first pass, display question # currentQuestionIndex
            idx = quizData.currentQuestionIndex;
            q = quizData.questions.(quizData.profession)(idx);
        else
            % 'review' phase, display question from incorrectList
            idx = quizData.incorrectList(quizData.reviewIndex);
            q = quizData.questions.(quizData.profession)(idx);
        end

        % Update question text
        set(quizData.questionText,'String',q.question);

        % Update each radio button
        for iOpt=1:3
            set(quizData.optionButtons(iOpt),...
                'String',q.options{iOpt},...
                'Value',0,...
                'Visible','on');
        end

        guidata(fig, quizData);
    end

    function submitAnswer(~,~)
        quizData = guidata(fig);

        % Determine which question we're on, depending on phase
        if strcmp(quizData.phase,'firstPass')
            idx = quizData.currentQuestionIndex;
        else
            idx = quizData.incorrectList(quizData.reviewIndex);
        end

        currentQ = quizData.questions.(quizData.profession)(idx);

        % Find user selection
        selected = 0;
        for iOpt = 1:3
            if get(quizData.optionButtons(iOpt),'Value') == 1
                selected = iOpt;
                break;
            end
        end
        if selected == 0
            warndlg('Please select an answer before submitting.','No Answer');
            return
        end

        % Check correctness
        if selected == currentQ.correct
            msgbox('Correct!','Feedback','modal');
            handleCorrectAnswer;
        else
            msgbox('Incorrect!','Feedback','modal');
            handleIncorrectAnswer;
        end
    end

    function handleCorrectAnswer
        quizData = guidata(fig);

        if strcmp(quizData.phase,'firstPass')
            % If correct in first pass, just move to next question
            quizData.currentQuestionIndex = quizData.currentQuestionIndex + 1;

            % If we've completed 5 questions in the first pass,
            % move to review phase if there are any incorrect
            if quizData.currentQuestionIndex > quizData.numQuestions
                if isempty(quizData.incorrectList)
                    finishQuiz;
                    return;
                else
                    % Switch to review phase
                    quizData.phase = 'review';
                    quizData.reviewIndex = 1;
                end
            end
        else
            % 'review' phase: correct answer means remove that index from incorrectList
            quizData.incorrectList(quizData.reviewIndex) = [];
            % If no more incorrect remain, quiz done
            if isempty(quizData.incorrectList)
                finishQuiz;
                return;
            end
            % Otherwise, if there are still some left, keep reviewIndex at 1,
            % or move to next. We'll just reset to 1 so we ask them in order:
            if quizData.reviewIndex > length(quizData.incorrectList)
                quizData.reviewIndex = 1;
            end
        end

        guidata(fig, quizData);
        displayQuestion;
    end

    function handleIncorrectAnswer
        quizData = guidata(fig);

        if strcmp(quizData.phase,'firstPass')
            % If incorrect in first pass, store that question index, move to next
            quizData.incorrectList(end+1) = quizData.currentQuestionIndex;
            quizData.currentQuestionIndex = quizData.currentQuestionIndex + 1;

            % Check if done with first pass
            if quizData.currentQuestionIndex > quizData.numQuestions
                if isempty(quizData.incorrectList)
                    finishQuiz;
                    return
                else
                    quizData.phase = 'review';
                    quizData.reviewIndex = 1;
                end
            end
            guidata(fig, quizData);
            displayQuestion;
        else
            % If incorrect in review phase, user must keep trying the same question
            % We do NOT remove it from the list, do not advance. They must try again.
            guidata(fig, quizData);
            % Just re-display same question
            displayQuestion;
        end
    end

    function finishQuiz
        quizData = guidata(fig);
        % Hide question panel
        set(quizData.questionPanel,'Visible','off');

        % Final message
        msgbox(['All questions for ' quizData.profession ' answered correctly!'],...
               'Quiz Complete');

        % Show profession selection again
        set(btnFarmer,'Visible','on');
        set(btnAstronaut,'Visible','on');
        set(btnConstruction,'Visible','on');
        set(btnChef,'Visible','on');
    end
end
