(function () {
    var allQuestions = [{
        question: "Who is Monica's brother",
        options: ["Ross Geller", "Chandler Bing", "Ben Geller", "Phoebe Buffay"],
        answer: 1
    }, {
        question: "What's the name of Ross's son?",
        options: ["Benjamin Geller", "Ben Willick", "Ben Geller", "Emma Geller"],
        answer: 3
    }, {
        question: "Which of the six members is Italian?",
        options: ["Joey Tribbiani", "Estelle", "Ross Geller", "No one is Italian"],
        answer: 1
    }, {
        question: "What's Mike's last name?",
            options: ["Buffay", "Hannigan", "Ramoray", "Not stated in the series"],
        answer: 2
    }, {
        question: "What is Ross's PhD?",
            options: ["Physics", "Pathology", "Museology", "Russ does not have PhD"],
        answer: 2
    }, {
        question: "Where did Emily come from?",
            options: ["Spain", "Haifa", "Paris", "England"],
        answer: 4
    }, {
        question: "What is Rachel doing for her living?",
            options: ["Professor", "Engaged in the fashion business", "High-tech business", "Nothing"],
        answer: 2
    }, {
        question: "Which soap opera did Joey attend?",
            options: ["Days of Our Lives", "the Bold and the Beautiful", "Mac and Cheese", "He did not attend a soap opera"],
        answer: 1
    }, {
        question: "What's Phoebe's job?",
            options: ["Singer", "Writer", "Masagist", "Fashion"],
        answer: 3
    }, {
        question: "What is the name of the cafe?",
            options: ["Cafe cafe", "Central Park", "Cafe Greg", "Central Perk"],
        answer: 4
    }];

    var quesCounter = 0;
    var selectOptions = [];
    var quizSpace = $('#quiz');

    nextQuestion();

    $('#next').click(function () {
        chooseOption();
        if (isNaN(selectOptions[quesCounter])) {
            alert('Choose your answer');
        }
        else {
            quesCounter++;
            nextQuestion();
        }
    });

    $('#prev').click(function () {
        chooseOption();
        quesCounter--;
        nextQuestion();
    });

    function createElement(index) {
        var element = $('<div>', { id: 'question' });
        var header = $('<h2>Question ' + (index + 1) + ' :</h2>');
        element.append(header);

        var question = $('<p>').append(allQuestions[index].question);
        element.append(question);

        var radio = radioButtons(index);
        element.append(radio);

        return element;
    }

    function radioButtons(index) {
        var radioItems = $('<ul>');
        var item;
        var input = '';
        for (var i = 0; i < allQuestions[index].options.length; i++) {
            item = $('<li>');
            input = '<input type="radio" name="answer" value=' + i + ' />';
            input += allQuestions[index].options[i];
            item.append(input);
            radioItems.append(item);
        }
        return radioItems;
    }

    function chooseOption() {
        selectOptions[quesCounter] = +$('input[name="answer"]:checked').val();
    }

    function nextQuestion() {
        quizSpace.fadeOut(function () {
            $('#question').remove();
            if (quesCounter < allQuestions.length) {
                var nextQuestion = createElement(quesCounter);
                quizSpace.append(nextQuestion).fadeIn();
                if (!(isNaN(selectOptions[quesCounter]))) {
                    $('input[value=' + selectOptions[quesCounter] + ']').prop('checked', true);
                }
                if (quesCounter === 1) {
                    $('#prev').show();
                }
                else if (quesCounter === 0) {
                    $('#prev').hide();
                    $('#next').show();
                }
            }
            else {
                var scoreRslt = displayResult();
                quizSpace.append(scoreRslt).fadeIn();
                $('#next').hide();
                $('#prev').hide();
            }
        });
    }

    function displayScore() {
        var score = $('<p>', { id: 'question' });

        var numCorrect = 0;
        for (var i = 0; i < selections.length; i++) {
            if (selections[i] === questions[i].correctAnswer) {
                numCorrect++;
            }
        }

        score.append('You got ' + numCorrect + ' questions out of ' +
            questions.length + ' right!!!');
        return score;
    }
})();