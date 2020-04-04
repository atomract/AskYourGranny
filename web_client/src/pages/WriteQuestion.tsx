import React, { useState, useCallback, useEffect, useRef, TextareaHTMLAttributes } from 'react';
import Page from '../layout/Page';
import styled from 'styled-components';
import { ReactComponent as Man } from '../images/man.svg';
import { withFirebase } from '../utils/withFirebase';
import Button from '../components/Button';
import Firebase from '../services/firebase';

export interface WriteQuestionProps {
  firebase?: Firebase;
}

type WizardStep = {
  title: string;
  component: React.ReactNode;
};

type WizardStepComponentProps = {
  onNext: (...args: any[]) => void;
  onPrev: () => void;
  onSubmit: () => void;
};

const WizardStepLayout = styled.section`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
`;

const SelectProfileWizardStep: React.FunctionComponent<WizardStepComponentProps> = ({ onNext }) => (
  <WizardStepLayout>
    <div style={{ display: 'flex', marginLeft: -15 }}>
      {Array(6)
        .fill(null)
        .map(() => (
          <div style={{ display: 'flex', flexDirection: 'column', marginLeft: 15 }}>
            <Man />
            Random Guy
          </div>
        ))}
    </div>
    <Button style={{ width: 112, marginTop: 102 }} onClick={onNext}>
      Next
    </Button>
  </WizardStepLayout>
);

const WriteQuestionWizardStep: React.FunctionComponent<WizardStepComponentProps> = ({ onNext }) => {
  const textareaEl = useRef<any>(null);

  return (
    <WizardStepLayout>
      <textarea
        ref={textareaEl}
        style={{ width: 409, height: 230 }}
        placeholder="Write your question here..."
      ></textarea>
      <Button
        style={{ width: 112, marginTop: 102 }}
        onClick={() => onNext(textareaEl.current?.value)}
      >
        Next
      </Button>
    </WizardStepLayout>
  );
};

const WriteQuestionAppreciationWizardStep: React.FunctionComponent<WizardStepComponentProps> = ({
  onNext,
  onSubmit
}) => (
  <WizardStepLayout>
    <textarea style={{ width: 409, height: 230 }}>Write your apprecition text here...</textarea>
    <Button
      style={{ width: 112, marginTop: 102 }}
      onClick={() => {
        onSubmit();
        onNext();
      }}
    >
      Send
    </Button>
  </WizardStepLayout>
);

const SuccessWizardStep: React.FunctionComponent<WizardStepComponentProps> = () => (
  <WizardStepLayout>
    <p>Thank you! You will find the answer in messages when it's answered.</p>
  </WizardStepLayout>
);

const WriteQuestion: React.SFC<WriteQuestionProps> = ({ firebase }) => {
  const [currentStepIndex, setCurrentStepIndex] = useState(0);
  const [questionBody, setQuestionBody] = useState('');
  const onNext = useCallback(() => {
    if (currentStepIndex + 1 >= wizardSteps.length) {
      return;
    }

    setCurrentStepIndex(currentStepIndex + 1);
  }, [currentStepIndex]);

  const onPrev = useCallback(() => {
    if (currentStepIndex - 1 < 0) {
      return;
    }

    setCurrentStepIndex(currentStepIndex - 1);
  }, [currentStepIndex]);

  const onSubmit = useCallback(() => {
    firebase?.addQuestion(questionBody);
  }, [currentStepIndex, questionBody]);

  const wizardSteps: WizardStep[] = [
    {
      title: 'Who do you want to send the Question to?',
      component: <SelectProfileWizardStep onNext={onNext} onPrev={onPrev} onSubmit={onSubmit} />
    },
    {
      title: 'Send out question to ${user}',
      component: (
        <WriteQuestionWizardStep
          onNext={text => {
            setQuestionBody(text);
            onNext();
          }}
          onPrev={onPrev}
          onSubmit={onSubmit}
        />
      )
    },
    {
      title: 'What will ${user} see after she answered your question?',
      component: (
        <WriteQuestionAppreciationWizardStep onNext={onNext} onPrev={onPrev} onSubmit={onSubmit} />
      )
    },
    {
      title: 'Great thanks for your care!',
      component: <SuccessWizardStep onNext={onNext} onPrev={onPrev} onSubmit={onSubmit} />
    }
  ];

  const currentStep = wizardSteps[currentStepIndex];

  return <Page topBarHeaderTitle={currentStep.title}>{currentStep.component}</Page>;
};

export default withFirebase(WriteQuestion);
