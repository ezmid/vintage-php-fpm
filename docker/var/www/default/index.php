<?php
// PHP Info
if (isset($_GET['phpinfo'])) {
    phpinfo();
    exit;
}

// Random quotes of the day
$quotes = [
    'I have seen many storms in my life. Most storms have caught me by surprise, so I had to learn very quickly to look further and understand that I am not capable of controlling the weather, to exercise the art of patience and to respect the fury of nature.',
    'Be brave. Take risks. Nothing can substitute experience.',
    'When you are enthusiastic about what you do, you feel this positive energy. It\'s very simple.',
    'Life was always a matter of waiting for the right moment to act.',
];
?>

<html>
<head>
<title>It works!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
</head>
<body>
    
    <div class="container">
        <nav class="navbar navbar-fixed">
            <div class="row">
                <div class="col-12">
                    <span class="">
                        Vintage Platform HUB
                    </span>
                </div>
            </div>
        </nav>
        <div class="row">
            <div class="col-9">
                <div class="row">
                    <div class="col-12">
                        <div class="jumbotron">
                            <h1 class="display-4">Whooohoooo!</h1>

                            <p class="lead">
                                Docker containers are up'n running!
                            </p>

                            <hr class="my-4">

                            <p>
                                <span class="h5">
                                    Quote for the moment
                                </span>
                            </p>

                            <p>
                                <span class="row">
                                    <span class="col-10">
                                        <q><?=$quotes[mt_rand(0, count($quotes)-1)]?></q>
                                        <br />
                                        <br />
                                        <span class="text-center">
                                            Paolo Coelho
                                        </span>
                                    </span>
                                    <span class="col-2">
                                        <img width="100%" src="https://upload.wikimedia.org/wikipedia/commons/c/c0/Coelhopaulo26012007-1.jpg" alt="" />
                                    </span>
                                </span>
                            </p>

                            <p class="lead">
                                    <a  class="btn btn-primary btn-lg"
                                    href="/app/"
                                    role="button"
                                    >
                                    Visit the app
                                </a>
                                <a  class="btn btn-info"
                                    href="/adminer/"
                                    role="button"
                                    >
                                    Explore the database
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <p>
                    <strong>Quick links</strong>
                </p>
                <p>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="/app/">Application</a>
                        </li>
                        <li class="list-group-item">
                            <a href="/adminer/">Database</a>
                        </li>
                        <li class="list-group-item">
                            <a href="/?phpinfo">
                                PHP Info
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="/coverage/">
                                Code Coverage
                            </a>
                        </li>
                    </ul>
                </p>
            </div>
        </div>
    </div>
</body>
</html>