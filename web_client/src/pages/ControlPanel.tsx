import React from 'react';
import Page from '../layout/Page';
import styled from 'styled-components';
import { ReactComponent as Comment } from '../images/comment.svg';
import { ReactComponent as Chat } from '../images/chat.svg';
import { ReactComponent as Patient } from '../images/patient.svg';
import { ReactComponent as Man } from '../images/man.svg';
import { ReactComponent as Date } from '../images/date.svg';
import { ReactComponent as Good } from '../images/good.svg';
import { ControlItem } from '../components/ControlItem';
import { ControlIconBox } from '../components/ControlIconBox';
import { Link } from 'react-router-dom';

const ControlItemsGrid = styled.div`
  display: grid;
  grid-template-columns: 1fr 1fr 1.35fr;
  grid-gap: 75px 81px;
`;

const StyledLink = styled(Link)`
  width: 100%;
  text-align: center;
`;

export interface ControlPanelProps {}

const ControlPanel: React.SFC<ControlPanelProps> = () => {
  return (
    <Page topBarHeaderTitle="What do you want to do?">
      <ControlItemsGrid>
        <ControlItem>
          <StyledLink to="/send-notification">
            <ControlIconBox>
              <Comment />
            </ControlIconBox>
            Send Out Notification
          </StyledLink>
        </ControlItem>
        <ControlItem>
          <ControlIconBox>
            <Patient />
          </ControlIconBox>
          Register a Senior
        </ControlItem>
        <ControlItem>
          <ControlIconBox>
            <Man />
            <Man />
            <Man />
            <Man />
          </ControlIconBox>
          See/Edit connected Seniors
        </ControlItem>
        <ControlItem>
          <ControlIconBox>
            <Date />
          </ControlIconBox>
          Schedule Weekly Notifications
        </ControlItem>
        <ControlItem>
          <ControlIconBox>
            <Chat />
          </ControlIconBox>
          See the community
        </ControlItem>
        <ControlItem>
          <ControlIconBox>
            <Good />
          </ControlIconBox>
          Community
        </ControlItem>
      </ControlItemsGrid>
    </Page>
  );
};

export default ControlPanel;
