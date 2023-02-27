(function () {
    var allQuestions = [{
        question: "",
        options: ["", "g", "", ""],
        answer: 2
    }, {
        question: "",
        options: ["g", "", "", ""],
        answer: 1
    }, {
        question: "",
        options: ["", "", "", "g"],
        answer: 4
    }, {
        question: "",
        options: ["", "", "", "g"],
        answer: 4
    }, {
        question: "",
        options: ["", "", "g", ""],
        answer: 3
    }, {
        question: "",
        options: ["g", "", "", ""],
        answer: 1
    }, {
        question: "",
        options: ["", "g", "", ""],
        answer: 2
    }, {
        question: "",
        options: ["", "", "g", ""],
        answer: 3
    }, {
        question: "",
        options: ["", "", "g", ""],
        answer: 3
    }, {
        question: "",
        options: ["", "", "", "g"],
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

    function displayResult() {
        var score = $('<p>', { id: 'question' });
        var correct = 0;
        for (var i = 0; i < selectOptions.length; i++) {
            if (selectOptions[i] === allQuestions[i].answer) {
                correct++;
            }
        }
        if (correct > 5) {
            score.append('You were right on ' + correct + ' out of ' + allQuestions.length + 'well done');
            return score;
        }
        else {
            score.append('You were right on ' + correct + ' out of ' + allQuestions.length + 'Not bad, if you keep exercising you will succeed better!');
            return score;
        }
    }
})();